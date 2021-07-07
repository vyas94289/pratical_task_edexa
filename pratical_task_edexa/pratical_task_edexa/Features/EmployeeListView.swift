//
//  ContentView.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject var viewModel = EmployeeListViewModel()
    @State var showSearch: Bool = false
    var body: some View {
        NavigationView {
            HStack {
                VStack(spacing: 0) {
                    if showSearch {
                        HStack(spacing: 0) {
                            Image(systemName: "magnifyingglass").foregroundColor(.gray)
                            TextField("Search terms here", text: $viewModel.searchText)
                                .padding(.horizontal, 8)
                        }
                        .padding()
                        .frame(height: 44)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding()
                    }
                    
                    HStack(){
                        Spacer()
                        ForEach(viewModel.tabs, id: \.self) { title in
                            Button(title) {
                                viewModel.selectedTab.value = title
                            }.foregroundColor(viewModel.tabColorFor(tab: title))
                            Spacer()
                        }.font(.subheadline)
                        
                    }.frame(height: 44)
                    contentView
                }.background(RoundedCorners(tl: 14, tr: 14, bl: 0, br: 0).fill(Color.white))
            }
            .background(Color(.primaryColor).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Employees", displayMode: .inline)
            .navigationBarItems(leading: Text("\(self.viewModel.selectedIds.count)").foregroundColor(.white), trailing: Button(action: {
                withAnimation {
                    self.showSearch.toggle()
                }
                
            }, label: {
                Image(systemName: "magnifyingglass")
            }))
            .onAppear {
                self.viewModel.employeesRequest()
            }
        }
    }
    
    private var contentView: some View {
        switch viewModel.state {
        case .loading:
            return VStack {
                Spacer()
                ProgressView()
                Spacer()
            }.eraseToAnyView()
            
        case .loaded:
            return ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.filteredList) { value in
                        EmployeeCellView(selectedIds: $viewModel.selectedIds, info: value)
                    }
                }
            }.eraseToAnyView()
        case .error(let error):
            return Text(error).eraseToAnyView()
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
