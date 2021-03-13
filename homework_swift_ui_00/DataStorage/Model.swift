//
//  Model.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.02.2021.
//

import Foundation

final class Storage { public static var model = Model() }

final class Model : ObservableObject {
    
    @Published var activeScreenIndex: Int = 3
    @Published var enableQuickAccess: Bool = false
    @Published var items: [AbstractItem] = [
        AbstractItem(name: "item_1", ordinal: 1),
        AbstractItem(name: "item_2", ordinal: 2),
        AbstractItem(name: "item_3", ordinal: 3),
        AbstractItem(name: "item_4", ordinal: 4),
        AbstractItem(name: "item_5", ordinal: 5)
    ]
    
}

struct AbstractItem : Hashable {
    let name: String
    let ordinal: Int
}

extension AbstractItem : Identifiable { var id: Int { ordinal } }
