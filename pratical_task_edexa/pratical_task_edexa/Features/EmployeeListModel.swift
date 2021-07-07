//
//  EmployeeListModel.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import Combine
import SwiftUI

class EmployeeListViewModel: ObservableObject {
    @Published var searchText: String = ""
    var list: [EmployeeInfo] = []
    @Published var filteredList: [EmployeeInfo] = []
    @Published private(set) var state: State
    var tabs: [String] = ["All", "Chicago", "Los Angeles", "NewYork"]
    var selectedTab: CurrentValueSubject<String, Never>
    @Published var selectedIds: [Int] = []
    private var bag = Set<AnyCancellable>()
    
    init() {
        state = .loading
        selectedTab = CurrentValueSubject(tabs[0])
        selectedTab.sink { _ in
            self.selectedIds = []
        }.store(in: &bag)
        Publishers.CombineLatest($searchText, selectedTab).sink { _state in
            self.filter()
        }.store(in: &bag)
       
    }
    
    func tabColorFor(tab: String) -> Color {
        return selectedTab.value.contains(tab) ? Color(.primaryColor) : Color.gray
    }
    
    func filter() {
        
        var filtered: [EmployeeInfo] = []
        if selectedTab.value == self.tabs.first! {
            filtered = self.list
        } else {
            filtered = self.list.filter({$0.city == selectedTab.value})
        }
        if searchText.isEmpty {
            self.filteredList = filtered
        } else {
            self.filteredList = filtered.filter({$0.fullName
                                                    .lowercased()
                                                    .contains(searchText.lowercased())})
        }
    }
}

extension EmployeeListViewModel {
    enum State {
        case loading
        case loaded
        case error(String)
    }
}

extension EmployeeListViewModel {
    
    func employeesRequest() {
        let onErrorCompletion: ((Subscribers.Completion<Error>) -> Void) = { completion in
            switch completion {
            case .finished: print(#function,"🏁 finished")
            case .failure(let error):
                self.state = .error(error.localizedDescription)
            }
        }
        let onValue: ([EmployeeInfo]) -> Void = { value in
            /*if let error = value.error {
                self.error = .error(error.message)
            }*/
            self.list = value
            self.filteredList = value
            self.state = .loaded
        }
        
        EmployeeAPI
            .fetchEmployees()
            .sink(receiveCompletion: onErrorCompletion, receiveValue: onValue)
            .store(in: &bag)
    }
}
