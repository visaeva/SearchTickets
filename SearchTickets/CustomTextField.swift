import SwiftUI
import UIKit

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.grayText)
                    .padding(.leading, -5)
            }
            TextField("", text: $text)
                .padding(.leading, -5)
                .onChange(of: text) { newValue in
                    text = filterCyrillic(input: newValue)
                }
        }
    }
    
    private func filterCyrillic(input: String) -> String {
        let cyrillicCharacters = input.filter { $0.isCyrillic }
        return String(cyrillicCharacters)
    }
}

extension Character {
    var isCyrillic: Bool {
        return ("А"..."я").contains(self) || self == "ё" || self == "Ё"
    }
}
