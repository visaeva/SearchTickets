
import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var fromCity: String
    @Binding var toCity: String
    @Binding var departureDate: Date
    @State private var returnDate: Date?
    @StateObject private var viewModel = TicketOfferViewModel()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, EEE"
        return formatter
    }()
    
    @State private var isDatePickerShowing = false
    @State private var isReturnDatePickerShowing = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action:{
                        }) {
                            Text("\(fromCity)")
                                .foregroundColor(.gray)
                                .lineLimit(1)
                                .padding(.leading, -5)
                        }
                        Spacer()
                        Button(action: {
                            swapCities()
                        }) {
                            Image("arrow")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    Divider().background(Color.lightGray)
                    
                    HStack {
                        Button(action:{
                        }) {
                            Text("\(toCity)")
                                .foregroundColor(.gray)
                                .lineLimit(1)
                                .padding(.leading, -5)
                        }
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("close")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.darkGray)
                )
                .frame(maxWidth: 340, maxHeight: 96)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.darkGray)
                                .frame(width: 105, height: 33)
                            
                            Button(action: {
                                isReturnDatePickerShowing.toggle()
                            }) {
                                Text(returnDate != nil ? "\(returnDate!, formatter: dateFormatter)" : "+ обратно")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 10)
                                    .lineLimit(1)
                            }
                        }
                        Button(action: {
                            isDatePickerShowing.toggle()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.darkGray)
                                    .frame(width: 88, height: 33)
                                
                                Text("\(departureDate, formatter: dateFormatter)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 10)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.darkGray)
                                .frame(width: 104, height: 33)
                            
                            Text("1, эконом")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.darkGray)
                                .frame(width: 115, height: 33)
                            
                            Text("Фильтры")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                }
                Spacer()
                FlightView(fromCity: $fromCity, toCity: $toCity, departureDate: $departureDate)
                    .environmentObject(viewModel)
                    .padding(.bottom, -40)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
            }
        }
        .sheet(isPresented: $isDatePickerShowing) {
            VStack {
                DatePicker("", selection: $departureDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .labelsHidden()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button("Выбрать") {
                    isDatePickerShowing.toggle()
                }
                .padding()
            }
        }
        .sheet(isPresented: $isReturnDatePickerShowing) {
            VStack {
                DatePicker("", selection: Binding(
                    get: { returnDate ?? Date() },
                    set: { returnDate = $0 }
                ), displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .labelsHidden()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button("Выбрать") {
                    isReturnDatePickerShowing.toggle()
                }
                .padding()
            }
        }
    }
    
    private func swapCities() {
        let temp = fromCity
        fromCity = toCity
        toCity = temp
    }
}


#Preview {
    SearchView(fromCity: .constant("Москва"), toCity: .constant("Сочи"), departureDate: .constant(Date()))
}
