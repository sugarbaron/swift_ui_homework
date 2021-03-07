//
//   UIKitInclusion.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 07.03.2021.
//

import SwiftUI

struct UIKitInclusion : UIViewRepresentable {
   typealias UIViewType = UIView
   
   func makeUIView(context: Context) -> UIView {
       let hostView = UIView()
       let height = NSLayoutConstraint(item: hostView,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 50)
       NSLayoutConstraint.activate([height])
       
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       let font = UIFont.systemFont(ofSize: 40).withTraits(traits: .traitItalic)
       let customizing: [NSAttributedString.Key : Any] = [
           NSAttributedString.Key.foregroundColor : UIColor.red,
           NSAttributedString.Key.font : font,
           NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue
       ]
       let text = NSMutableAttributedString(string:"bye, ui kit", attributes: customizing)
       label.attributedText = text
       
       hostView.addSubview(label)
       let centerX = NSLayoutConstraint(item: label,
                                        attribute: .centerX,
                                        relatedBy: .equal,
                                        toItem: hostView,
                                        attribute: .centerX,
                                        multiplier: 1,
                                        constant: 0)
       let top = NSLayoutConstraint(item: label,
                                    attribute: .top,
                                    relatedBy: .equal,
                                    toItem: hostView,
                                    attribute: .top,
                                    multiplier: 1,
                                    constant: 0)
       NSLayoutConstraint.activate([centerX, top])
       
       return hostView
   }
   
   

   func updateUIView(_ uiView: UIView, context: Context) {}
}

extension UIFont {
   func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
       if let descriptor = fontDescriptor.withSymbolicTraits(traits) {
           return UIFont(descriptor: descriptor, size: self.pointSize)
       }
       return self
   }
}
