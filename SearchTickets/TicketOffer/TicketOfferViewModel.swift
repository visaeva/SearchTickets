import SwiftUI
import Combine


class TicketOfferViewModel: ObservableObject {
    @Published var ticketsOffers: [FlightStruct] = []
    private var cancellable: AnyCancellable?
    
    func loadOffers() {
        guard let url = URL(string: "https://run.mocky.io/v3/38b5205d-1a3d-4c2f-9d77-2f9d1ef01a4a") else {
            print("Invalid URL")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: TicketsOffersResponse.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Decoding failed: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.ticketsOffers = response.ticketsOffers
            })
    }
    
    func imageName(for id: Int) -> String {
        switch id {
        case 1:
            return "redCircle"
        case 2:
            return "blueCircle"
        case 3:
            return "whiteCircle"
        default:
            return "redCircle"
        }
    }
}

