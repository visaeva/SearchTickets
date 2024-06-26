
import SwiftUI

struct PopularPlaceView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(popularPlace, id: \.imageName) { place in
                HStack(spacing: 10) {
                    Image(place.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading) {
                        Text(place.city)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .lineLimit(1)
                        
                        Text(place.title)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Divider().background(Color.lightGrayText)
                    .padding(.horizontal, 20)
            }
        }
        .padding(20)
        .background(Color.darkGray)
        .cornerRadius(10)
    }
}

#Preview {
    PopularPlaceView()
}
