
//
//  Tabs.swift
//  ProjectSwift
//
//  Created by Turma02-11 on 30/07/24.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView{
            
            Home().tabItem {Image(systemName: "house.fill") }
            Config().tabItem { Image(systemName: "gearshape.fill") }
            Notifie().tabItem { Image(systemName: "bell.fill") }
            Profile().tabItem { Image(systemName: "person.fill") }
        }
    }
}

#Preview {
    Tabs()
}
