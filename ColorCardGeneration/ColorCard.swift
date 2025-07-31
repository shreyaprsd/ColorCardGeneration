//
//  ColorCard.swift
//  ColorCardGeneration
//
//  Created by Shreya Prasad on 31/07/25.
//

import SwiftUI

struct ColorCard: View {
    let record : ColorRecord
    var body: some View {
        VStack(spacing: 12){
            VStack{
                RoundedRectangle(cornerRadius:  8)
                    .fill(record.color)
                    .frame(width: 50, height: 50)
                Text(record.hex)
                    .font(.title2)
                    .fontWeight(.medium)
                
            }.padding()
        
            Text(record.timeStamp, style: .date)
                .font(.title3)
                .fontWeight(.light)
            Text(record.timeStamp , style: .time)
                .font(.title3)
                .fontWeight(.light)
        }
    }
}
#Preview {
    ColorCard(record: ColorRecord(color: Color("gray"), hex: "#808080", timeStamp: .now))
}
