
import SwiftUI

struct MainView: View {
    @State private var placeView: PlaceView = PlaceView()
    var body: some View {
        VStack(spacing:20) {
            Text("Поиск дешевых авиабилетов")
                .foregroundStyle(.white)
                .font(.largeTitle)
            
            PlaceView()
            
            Text("Музыкально отлететь")
                .foregroundStyle(.white)
                .font(.title)
                .padding(.top, 20)
                .padding(.leading, -80)
            
            RecomendedView()
            
            Spacer()
            
            TabBarView()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 1)
                .foregroundColor(.line)
                .padding(.top, 530)
        )
        .background(Color.blackBackground.ignoresSafeArea())
    }
}

#Preview {
    MainView()
}
