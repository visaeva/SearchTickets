
import SwiftUI

struct RecomendedView: View {
    @ObservedObject private var viewModel = RecomendedViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 40) {
                ForEach(viewModel.offers) { offer in
                    VStack(alignment: .leading, spacing: 5) {
                        Image(viewModel.imageName(for: offer.id))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 132, height: 133)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        Text(offer.title)
                            .foregroundStyle(.white)
                        Text(offer.town)
                            .foregroundStyle(.white)
                        HStack {
                            Image("avia")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("от " + viewModel.formattedPrice(offer.price.value))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.blackBackground)
        .onAppear(perform: viewModel.loadOffers)
    }
}

#Preview {
    RecomendedView()
}
