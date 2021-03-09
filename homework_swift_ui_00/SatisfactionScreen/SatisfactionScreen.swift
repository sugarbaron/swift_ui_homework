//
//  SatisfactionScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.02.2021.
//

import SwiftUI

struct SatisfactionScreen : View {
    
    @State private var windowRequested: Bool = false
    
    var body: some View {
        Button(action: { windowRequested.toggle() }) {
            VStack {
                Text("push me").font(.system(size: 50))
            }
        }.sheet(isPresented: $windowRequested) { Text("modal window").font(.system(size: 50)) }
    }
}


// MARK: preview

struct SatisfactionScreen_Previews : PreviewProvider {
    static var previews: some View {
        SatisfactionScreen()
            .previewDevice("iPhone 11")
    }
}

