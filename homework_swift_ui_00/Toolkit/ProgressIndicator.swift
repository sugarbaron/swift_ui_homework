//
//  ProgressIndicator.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.03.2021.
//

import SwiftUI

struct ProgressIndicator : View {
    
    var body: some View {
        HStack { Spacer(); ProgressView().progressViewStyle(CircularProgressViewStyle()); Spacer() }
    }
    
}
