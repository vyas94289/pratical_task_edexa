//
//  EmployeeCellView.swift
//  pratical_task_edexa
//
//  Created by Gaurang Vyas on 07/07/21.
//

import SwiftUI

struct EmployeeCellView: View {
    @Binding var selectedIds: [Int]
    @State var color: Color = .clear
    var info: EmployeeInfo
    var body: some View {
        ZStack(alignment: .leading){
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.gray,lineWidth: 0.5)
                    
            }
            .background(color)
            .cornerRadius(8)
            .padding(.leading, 20)
            HStack {
                Text(String(info.fullName.first ?? String.Element("")))
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(.primaryColor))
                    .cornerRadius(20)
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(info.fullName)
                        Divider()
                        Text(info.city)
                            .font(.callout)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Image(systemName: "chevron.right.circle")
                        .foregroundColor(.gray).opacity(0.3)
                        .font(.title)
                }
                
                Spacer()
            }
        }
        .onAppear {
            self.setColor()
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .onLongPressGesture {
            longPressAt()
        }
        
    }
    
    func longPressAt() {
        if selectedIds.contains(info.id) {
            selectedIds.removeAll(where: {$0 == info.id})
        } else {
            selectedIds.append(info.id)
        }
        setColor()
    }
    
    func setColor() {
        color = selectedIds.contains(info.id) ? Color(.primaryColor).opacity(0.5) : Color.clear
    }

}
