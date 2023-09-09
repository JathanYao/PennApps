//
//  NavBar.swift
//  PennApps2023
//
//  Created by Owen Guo on 2023-09-08.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case scroll
    case map
    case trophy
    case gearshape
}

struct NavBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .scroll:
            return .yellow
        case .map:
            return .green
        case .trophy:
            return .yellow
        case .gearshape:
            return .gray
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage: tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size:22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration:0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                    
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
            .opacity(0.8)
            
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(selectedTab: .constant(.house))
    }
}
 
