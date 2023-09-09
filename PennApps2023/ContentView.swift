import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            if tab == .house {
                                house()
                            }
                            
                            if tab == .scroll {
                                scroll()
                            }
                            
                            if tab == .map {
                                map()
                            }
                            
                            if tab == .trophy {
                                trophy()
                            }
                            
                            if tab == .gearshape {
                                gearshape()
                            }
                            
                        }
                        .tag(tab)
                        
                    }
                }
            }
            VStack {
                Spacer()
                NavBar(selectedTab: $tabSelected)
            }
        }
    }
}


struct house: View {
    @State private var name: String = ""


    var body: some View {
        VStack {
            Text("House")
                
        }
        .background(Color.blue)
    }
}

struct scroll: View {
    var body: some View {
        VStack {
            Text("Scroll")
                
        }
        .background(Color.cyan)
    }
}

struct map: View {
    var body: some View {
        VStack {
            Text("Map")
                
        }
        .background(Color.green)
    }
}

struct trophy: View {
    var body: some View {
        VStack {
            Text("Leaderboard")
                
        }
        .background(Color.orange)
    }
}

struct gearshape: View {
    var body: some View {
        VStack {
            Text("Settings")
                
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
