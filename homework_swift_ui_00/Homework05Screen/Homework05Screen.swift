//
//  Homework05Screen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 13.03.2021.
//

import SwiftUI

struct Homework05Screen : View {
    
    @State var currentDataSet: Int = 0
    @EnvironmentObject var dataSource: ViewModelMock
    
    var body: some View {
        VStack {
            Text("title").font(.largeTitle)
            
            Picker("options", selection: $currentDataSet) {
                Text("1").tag(0)
                Text("2").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(5)
            .foregroundColor(.white)
            
            List { ForEach(dataSource.dataSets[currentDataSet]) {
                Text("\($0)")
            } }
        }
    }
}

final class ViewModelMock : ObservableObject {
    
    @Published var dataSets: [[Int]] = [[1, 11, 111, 1111, 11111], [2, 22, 222, 2222, 22222]]
    
}

extension Int : Identifiable { public var id: Int { self } }

struct Homework05Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homework05Screen().environmentObject(ViewModelMock())
    }
}
