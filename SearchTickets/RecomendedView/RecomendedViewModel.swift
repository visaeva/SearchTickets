import SwiftUI
import Combine

class RecomendedViewModel: ObservableObject {
    @Published var offers: [RecomendedStruct] = []
    private var cancellable: AnyCancellable?
    
    func loadOffers() {
        guard let url = URL(string: "https://run.mocky.io/v3/ad9a46ba-276c-4a81-88a6-c068e51cce3a") else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: OffersResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Decoding failed: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.offers = response.offers
            })
    }
    
    func formattedPrice(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        return numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    func imageName(for id: Int) -> String {
        switch id {
        case 1:
            return "image1"
        case 2:
            return "image2"
        case 3:
            return "image3"
        default:
            return "image1"
        }
    }
}
