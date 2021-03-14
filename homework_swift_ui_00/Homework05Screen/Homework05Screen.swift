//
//  Homework05Screen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 13.03.2021.
//

import SwiftUI

struct Homework05Screen : View {
    
    var body: some View {
        NavigationRouter { RootScreen() }
    }
    
}

struct RootScreen : View {
    
    @State var currentDataSet: Int = 0
    @EnvironmentObject var dataSource: ViewModelMock
    @EnvironmentObject var navigation: Navigation
    
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
            
            List { ForEach(dataSource.dataSets[currentDataSet]) { dataExample in
                Text("\(dataExample.level1)")
                    .onTapGesture { navigation.show(LevelXScreen(dataExample, 2)) }
            } }
        }
    }
    
}

struct LevelXScreen : View {
    
    private let data: DataExample
    private let level: Int
    @EnvironmentObject var navigation: Navigation

    init(_ data: DataExample, _ level: Int) { self.data = data; self.level = level }
    
    var body: some View { VStack {
        Text("\(title)").onTapGesture { navigation.show(LevelXScreen(data, level + 1)) }
        Spacer().frame(height: 50)
        Text("go back").onTapGesture { navigation.goBack() }
    } }
    
    var title: String {
        switch level {
        case 1:  return data.level1
        case 2:  return data.level2
        case 3:  return data.level3
        default: return "woops!"
        }
    }
    
}

final class ViewModelMock : ObservableObject {
    
    @Published var dataSets: [[DataExample]] = [
        [DataExample(id: 10000),
         DataExample(id: 11000),
         DataExample(id: 11100),
         DataExample(id: 11110),
         DataExample(id: 11111)],
        
        [DataExample(id: 20000),
         DataExample(id: 22000),
         DataExample(id: 22200),
         DataExample(id: 22220),
         DataExample(id: 22222)]
    ]
    
}

struct DataExample : Identifiable {
    
    let id: Int
    var level1: String { "level 1 of \(id)" }
    var level2: String { "level 2 of \(id)" }
    var level3: String { "level 3 of \(id)" }
    
}

struct Homework05Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homework05Screen().environmentObject(ViewModelMock())
    }
}
