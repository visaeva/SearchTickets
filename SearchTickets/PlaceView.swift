import SwiftUI

struct PlaceView: View {
    @State private var isShowingDetailPlaceView = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("search")
                        .padding()
                    VStack(alignment: .leading) {
                        Button(action:{
                            isShowingDetailPlaceView = true
                        }) {
                            Text("Откуда - Москва")
                                .foregroundStyle(Color.grayText)
                                .lineLimit(1)
                        }
                        .sheet(isPresented: $isShowingDetailPlaceView) {
                            DetailPlaceView()
                        }
                        CustomDivider().style(color: .lightGrayText, lineWidth: 1)
                        
                        Button(action:{
                            isShowingDetailPlaceView = true
                        }) {
                            Text("Куда - Турция")
                                .foregroundStyle(Color.grayText)
                                .lineLimit(1)
                        }
                        .sheet(isPresented: $isShowingDetailPlaceView) {
                            DetailPlaceView()
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                }
                .padding(.trailing, 20)
                .frame(maxWidth: 340, maxHeight: 90)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.lightGray)
                )
            }
            .frame(maxWidth: 370, maxHeight: 122)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.darkGray)
            )
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView()
    }
}

