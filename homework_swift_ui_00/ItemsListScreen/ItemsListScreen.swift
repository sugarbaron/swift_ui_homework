//
//  ItemsListScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.02.2021.
//

import SwiftUI

struct ItemsListScreen : View {
    
    @ObservedObject var model: Model
    
    init(_ model: Model) { self.model = model }
    
    var body: some View {
        NavigationView {
            List { ForEach(getEnumerated(model), id: \.1) { index, item in
                ItemCell(item: item, isDynamic: index == 2, model: model)
            } }
            .navigationTitle(Text("items"))
            // тип для @binding и $smth
            // зачем дроч с потоками на NavigationLink(isActive) ?
            // объявление @EnvironmentObject var router: Router  как-то отличается от объявления scenePhase?
            // какую проблему решает UIViewRepresentable
        }
    }
    
    private func getEnumerated(_ model: Model) -> [(index: Int, item: AbstractItem)] {
        Array(zip(model.items.indices, model.items))
    }
}

struct ItemCell : View {
    
    let item: AbstractItem
    let isDynamic: Bool
    @ObservedObject var model: Model
    
    var body: some View {
        isDynamic
            ? NavigationLink(item.name,
                             destination: Text(item.name),
                             isActive: $model.enableQuickAccess)
            : NavigationLink(destination: Text(item.name)) { Text(item.name) }
    }
    
}


// MARK: preview

struct ItemsListScreen_Previews : PreviewProvider {
    
    private static let modelMock: Model = .init()
    
    static var previews: some View {
        ItemsListScreen(modelMock)
            .previewDevice("iPhone 11")
    }
}
