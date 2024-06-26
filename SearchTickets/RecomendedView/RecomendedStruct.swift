
import SwiftUI

struct RecomendedStruct: Decodable, Identifiable {
    let id: Int
    var imageName: String?
    let title: String
    let town: String
    let price: Price
}

struct Price: Decodable {
    let value: Int
}

struct OffersResponse: Decodable {
    let offers: [RecomendedStruct]
}

let offers: [RecomendedStruct] = [
    RecomendedStruct(id:1, title: "Die Antwoord", town: "Будапешт", price: Price(value: 2390)),
    RecomendedStruct(id: 2,  title: "Socrat& Lera", town: "Санкт - Петербург", price: Price(value: 2390)),
    RecomendedStruct(id: 3,  title: "Socrat& Lera", town: "Санкт - Петербург", price: Price(value: 2390))
]
