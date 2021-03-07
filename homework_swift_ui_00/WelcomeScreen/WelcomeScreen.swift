//
//  WelcomeScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.02.2021.
//

import SwiftUI
 
struct WelcomeScreen : View {
    var body: some View {
         VStack {
            Text("hell-o-swift-ui")
                 .font(.largeTitle).bold()
            Spacer().frame(height: 80)
            Button(action: { withAnimation {
                Storage.model.activeScreenIndex = 1
                Storage.model.enableQuickAccess = true
             } }) {
                Text("show item 3").font(.system(size: 30))
            }
            Spacer().frame(height: 80)
            UIKitInclusion()
                .fixedSize()
         }
     }
 }


// MARK: preview

struct WelcomeScreen_Previews : PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
            .previewDevice("iPhone 11")
    }
}
