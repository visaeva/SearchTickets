
import SwiftUI

struct AllTicketsStruct: Identifiable, Decodable {
    let id: Int
    let badge: String?
    let price: Price
    let provider_name: String
    let company: String
    let departure: FlightInfo
    let arrival: FlightInfo
    let has_transfer: Bool
    let has_visa_transfer: Bool
    let luggage: Luggage
    let hand_luggage: HandLuggage
    let is_returnable: Bool
    let is_exchangable: Bool
    
    var departureTime: String {
        formatDate(departure.date, format: "HH:mm")
    }
    
    var arrivalTime: String {
        formatDate(arrival.date, format: "HH:mm")
    }
    
    var flightDuration: String {
        let startDate = parseDate(departure.date)
        let endDate = parseDate(arrival.date)
        let duration = endDate.timeIntervalSince(startDate)
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        return "\(hours)ч \(minutes)м в пути"
    }
    
    var transferText: String {
        has_transfer ? "" : "/Без пересадок"
    }
    
    private func parseDate(_ dateString: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: dateString) ?? Date()
    }
    
    private func formatDate(_ dateString: String, format: String) -> String {
        let date = parseDate(dateString)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}

struct FlightInfo: Decodable {
    let town: String
    let date: String
    let airport: String
}

struct Luggage: Decodable {
    let has_luggage: Bool
    let price: Price?
}

struct HandLuggage: Decodable {
    let has_hand_luggage: Bool
    let size: String?
}

