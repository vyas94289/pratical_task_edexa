//
//  TabbarView.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView() {
            EmployeeListView()
               .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
                
                
            Color.red
                .tabItem {
                    Image(systemName: "plus.circle")
                   
                }
                .tag(1)
            
            Color.purple
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(2)
                
        }.accentColor(Color(.primaryColor))
    }
}
