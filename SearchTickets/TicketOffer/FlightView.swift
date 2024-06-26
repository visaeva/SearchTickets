
import SwiftUI

struct FlightView: View {
    @State private var isSubscribed = false
    @State private var showAllTickets = false
    @EnvironmentObject var viewModel: TicketOfferViewModel
    @State private var isAllTicketsViewActive = false
    @Binding var fromCity: String
    @Binding var toCity: String
    @Binding var departureDate: Date
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blackBackground
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(spacing: 20) {
                        Text("Прямые рейсы")
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .regular))
                        
                        ForEach(viewModel.ticketsOffers, id: \.id) { flight in
                            HStack(spacing: 10) {
                                Image(viewModel.imageName(for: flight.id))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(flight.title)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                            .lineLimit(1)
                                        Spacer()
                                        Text("\(flight.price.value) ₽ >")
                                            .foregroundColor(.blue)
                                            .font(.system(size: 14, weight: .regular))
                                            .lineLimit(1)
                                    }
                                    
                                    Text(flight.timeRange.joined(separator: " "))
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .lineLimit(1)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            
                            Divider().background(Color.gray)
                                .padding(.horizontal, 20)
                        }
                        .fullScreenCover(isPresented: $showAllTickets) {
                            AllTickets(fromCity: $fromCity, toCity: $toCity, departureDate: departureDate)
                        }
                    }
                    .padding(20)
                    .background(Color("lineColor"))
                    .cornerRadius(10)
                    
                    HStack {
                        Button(action: {
                            showAllTickets = true
                        }) {
                            Text("Посмотреть все билеты")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding()
                                .frame(width: 328, height: 42)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        }
                    }
                    VStack(spacing: 10) {
                        Toggle(isOn: $isSubscribed) {
                            HStack {
                                Image("bell")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .padding(.leading, 10)
                                
                                Text("Подписка на цену")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14))
                                    .padding(.leading, 5)
                            }
                        }
                        .tint(.blue)
                        .padding(.trailing, 10)
                        .font(.system(size: 14))
                        .frame(width: 328, height: 51)
                        .accentColor(.blue)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.grayBackground))
                        .padding(.top, 10)
                    }
                    TabBarView()
                        .padding(.top, 50)
                }
            }
            .onAppear(perform: viewModel.loadOffers)
            .navigationBarHidden(true)
        }
    }
}

/*#Preview {
 FlightView()
 
 }*/

