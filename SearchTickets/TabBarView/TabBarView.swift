
import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.blackBackground
    }
    
    var body: some View {
        VStack {
            TabView {
                Text("Авиабилеты")
                    .tabItem {
                        Label("Авиабилеты", image: "avia")
                            .foregroundColor(.white)
                    }
                Text("Отели")
                    .tabItem {
                        Label("Отели", image: "hotel")
                            .foregroundColor(.white)
                    }
                
                Text("Короче")
                    .tabItem {
                        Label("Короче", image: "place")
                            .foregroundColor(.white)
                    }
                
                Text("Подписки")
                    .tabItem {
                        Label("Подписки", image: "subscript")
                            .foregroundColor(.white)
                    }
                
                Text("Профиль")
                    .tabItem {
                        Label("Профиль", image: "profile")
                            .foregroundColor(.white)
                    }
            }
            .accentColor(.blue)
            
            HStack {
                Button(action: {
                    
                }) {
                    Image("tasks")
                }
                .padding()
                
                Button(action: {
                    
                }) {
                    Image("home")
                }
                .padding()
                
                Button(action: {
                    
                }) {
                    Image("back")
                }
                .padding()
            }
            .foregroundColor(.white)
            .background(Color.blackBackground)
        }
        .frame(height: 80) 
        .background(Color.blackBackground.ignoresSafeArea())
    }
}

#Preview {
    TabBarView()
}
