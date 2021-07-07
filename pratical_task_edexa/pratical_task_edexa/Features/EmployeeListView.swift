//
//  ContentView.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import SwiftUI

struct EmployeeListView: View {
   @StateObject var viewModel = EmployeeListViewModel()
    @State var selectedIds: [Int] = []
    var body: some View {
        NavigationView {
            HStack {
                VStack(spacing: 0) {
                    HStack(){
                        Spacer()
                        ForEach(viewModel.tabs, id: \.self) { title in
                            Button(title) {
                                viewModel.selectedTab = title
                            }.foregroundColor(viewModel.tabColorFor(tab: title))
                            Spacer()
                        }.font(.subheadline)
                        
                    }.frame(height: 44)
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(viewModel.list) { value in
                               EmployeeCellView(selectedIds: $selectedIds, info: value)
                            }
                        }
                    }
                }.background(RoundedCorners(tl: 14, tr: 14, bl: 0, br: 0).fill(Color.white))
            }
            
            .background(Color(.primaryColor).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Employees", displayMode: .inline)
            .navigationBarItems(leading: Text("\(selectedIds.count)").foregroundColor(.white), trailing: Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
            }))
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
