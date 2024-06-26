import SwiftUI

struct DetailPlaceView: View {
    @State private var fromText: String = ""
    @State private var toText: String = ""
    @State private var isSearchActive: Bool = false
    @State private var departureDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Color.clear.frame(height: 20)
                VStack(alignment: .leading) {
                    HStack {
                        Image("airplane")
                            .padding(.trailing, 10)
                        CustomTextField(placeholder: "Откуда - Москва", text: $fromText)
                            .foregroundColor(.grayText)
                        Spacer()
                        Button(action: {
                            fromText = ""
                        }) {
                            Image("close")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    CustomDivider().style(color: .lightGrayText, lineWidth: 1)
                    
                    HStack(spacing: 20) {
                        Image("search")
                            .padding(.trailing, 10)
                        CustomTextField(placeholder: "Куда - Турция", text: $toText)
                            .foregroundColor(.grayText)
                            .onChange(of: toText) { newValue in
                                updateSearchState()
                            }
                        Spacer()
                        if !toText.isEmpty && toText.count >= 4 {
                            Button(action: {
                                toText = ""
                            }) {
                                Image("close")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .frame(maxWidth: 340, maxHeight: 96)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.lightGray))
                
                HStack(alignment: .top, spacing: 25) {
                    VStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.greenBackground)
                            .frame(width: 48, height: 48)
                            .overlay(
                                Image("road")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24))
                        Text("Сложный\nмаршрут")
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blueBackground)
                            .frame(width: 48, height: 48)
                            .overlay(
                                Image("world")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24))
                        Text("Куда угодно")
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.darkBlueBackground)
                            .frame(width: 48, height: 48)
                            .overlay(
                                Image("calendar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24))
                        Text("Выходные")
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.redBackground)
                            .frame(width: 48, height: 48)
                            .overlay(
                                Image("fire")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24))
                        Text("Горячие\nбилеты")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                .padding(.top, 10)
                .padding(.leading, 1)
                PopularPlaceView()
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                Spacer()
                    .fullScreenCover(isPresented: $isSearchActive) {
                        SearchView(fromCity: $fromText, toCity: $toText, departureDate: $departureDate)
                    }
            }
            .background(Color.blackBackground.ignoresSafeArea())
        }
        .navigationBarHidden(true)
    }
    
    private func updateSearchState() {
        isSearchActive = !fromText.isEmpty && !toText.isEmpty && toText.count >= 4
    }
}


#Preview {
    DetailPlaceView()
}

