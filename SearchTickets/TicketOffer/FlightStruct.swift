
import SwiftUI

struct FlightStruct: Decodable, Identifiable {
    let id: Int
    let imageName: String?
    let title: String
    let timeRange: [String]
    let price: Price
}

struct TicketsOffersResponse: Decodable {
    let ticketsOffers: [FlightStruct]
}

let ticketsOffers: [FlightStruct] = [
    FlightStruct(id: 1, imageName: "redCircle", title: "Уральские авиалинии", timeRange: ["07:00 09:10 10:00 11:00 12:00 13:00"], price: Price(value: 2390)),
    FlightStruct(id: 2, imageName: "blueCircle", title: "Победа", timeRange: ["08:05 09:55 16:35 18:55"], price: Price(value: 2390)),
    FlightStruct(id: 3, imageName: "whiteCircle", title: "NordStar", timeRange: ["13:10"], price: Price(value: 2390)),
]


