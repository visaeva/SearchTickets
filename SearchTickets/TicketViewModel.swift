
import SwiftUI
import Combine

class TicketViewModel: ObservableObject {
    @Published var flights: [AllTicketsStruct] = []
    
    init() {
        loadTickets()
    }
    
    func loadTickets() {
        guard let url = URL(string: "https://run.mocky.io/v3/c0464573-5a13-45c9-89f8-717436748b69") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data")
                return
            }
            
            do {
                let flights = try JSONDecoder().decode([String: [AllTicketsStruct]].self, from: data)["tickets"] ?? []
                DispatchQueue.main.async {
                    self.flights = flights
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }
}
