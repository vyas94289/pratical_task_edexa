//
//  EmployeeListModel.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import Combine
import SwiftUI

class EmployeeListViewModel: ObservableObject {
    @Published var list = dummy
    var tabs: [String] = ["All", "Chicago", "Los Angeles", "NewYork"]
    @Published var selectedTab: String
    @Published var selectedIds: [Int] = []
    
    init() {
        selectedTab = tabs[0]
    }
    
    func tabColorFor(tab: String) -> Color {
        return selectedTab.contains(tab) ? Color(.primaryColor) : Color.gray
    }
}
