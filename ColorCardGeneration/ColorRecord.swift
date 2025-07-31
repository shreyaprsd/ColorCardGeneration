//
//  ColorRecord.swift
//  ColorCardGeneration
//
//  Created by Shreya Prasad on 31/07/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class ColorRecord  {
     var  id = UUID()
     var  hex : String
     var timeStamp : Date
    var red : Double
    var green : Double
    var blue : Double
    var color : Color {
        return Color(red: red, green: green, blue: blue)
    }
    
    
    init(id: UUID = UUID(),color: Color, hex: String, timeStamp: Date) {
        
        self.id = id
        self.hex = hex
        self.timeStamp = timeStamp
        
        let uiColor = UIColor(color)
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        var a : CGFloat = 0
        uiColor.getRed(&r, green: &b, blue: &g, alpha: &a)
                self.red = Double(r)
                self.green = Double(g)
                self.blue = Double(b)

    }
    
}


