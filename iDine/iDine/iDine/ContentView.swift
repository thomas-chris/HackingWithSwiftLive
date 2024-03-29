//
//  ContentView.swift
//  iDine
//
//  Created by Chris Thomas on 08/07/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @EnvironmentObject var order: Order
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            ItemRow(item: item).environmentObject(self.order)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Menu"))
            .listStyle(.grouped)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Order())
    }
}
#endif
