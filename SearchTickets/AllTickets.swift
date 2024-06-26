import SwiftUI

struct AllTickets: View {
    @ObservedObject var viewModel = TicketViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var fromCity: String
    @Binding var toCity: String
    
    var departureDate: Date
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, EEE"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image("back2")
                                .foregroundColor(.white)
                        }
                        VStack(alignment: .leading) {
                            Text("\(fromCity) - \(toCity)")
                                .foregroundColor(.white)
                            Text("\(departureDate, formatter: dateFormatter), 1 пассажир")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color("lineColor"))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    ScrollView {
                        ForEach(viewModel.flights) { flight in
                            VStack(alignment: .leading, spacing: 10) {
                                if let badge = flight.badge {
                                    Text(badge)
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .foregroundColor(.white)
                                        .background(RoundedRectangle(cornerRadius: 50).fill(Color.blue))
                                        .padding(.leading, -45)
                                        .frame(width: 155, height: 25)
                                        .padding(.top, -20)
                                }
                                HStack {
                                    Text("\(flight.price.value) ₽")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top, -5)
                                }
                                HStack {
                                    Image("redCircle")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.top, 10)
                                    Text("\(flight.departureTime) – \(flight.arrivalTime)")
                                        .padding(.top, -25)
                                    Text(flight.flightDuration + flight.transferText)
                                        .lineLimit(1)
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(.bottom, 30)
                                }
                                HStack {
                                    Text("\(flight.departure.airport) - \(flight.arrival.airport)")
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(.leading, 35)
                                        .padding(.top, -25)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color("lineColor")))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        }
                    }
                }
                .background(Color.blackBackground.ignoresSafeArea())
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                        }) {
                            HStack {
                                Image("filter")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("Фильтр")
                            }
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                            .padding()
                        }
                        Button(action: {
                        }) {
                            HStack {
                                Image("grafic")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("График цен")
                            }
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                            .padding()
                            .padding(.leading, -20)
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 50).fill(Color.blue))
                    .frame(width: 303, height: 37)
                    .padding()
                }
            }
        }
        TabBarView()
            .padding(.top, 20)
            .navigationBarHidden(true)
    }
}

#Preview {
    AllTickets(fromCity: .constant("Москва"), toCity: .constant("Сочи"), departureDate: Date())
}
