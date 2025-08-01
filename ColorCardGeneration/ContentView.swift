//
//  ContentView.swift
//  ColorCardGeneration
//
//  Created by Shreya Prasad on 31/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort:\ColorRecord.timeStamp , order: .reverse)
    private var colorRecords : [ColorRecord]
    var body: some View {
        
        VStack(alignment: .leading,spacing: 2) {
            Text("Color Card 🎨")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(30)
            Button("Generate Colors") {
                addColor()
            }
            
            .font(.title3)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.cyan)
            .frame(maxWidth: .infinity)
            
        }
        ScrollView{
            
            LazyVStack(spacing:12){
                ForEach(colorRecords) {
                    record in
                    VStack{
                        ColorCard(record: record)
                        Button("Delete", systemImage: "trash",role: .destructive){
                            deleteColor(record)
                        }
                        .padding()
                        .buttonBorderShape(.roundedRectangle)
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                        .cornerRadius(12)
                    .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
                    .overlay(
                    RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray5), lineWidth: 1)
                            )
                    
                }
               
            }.padding()
        }
    }

        
    
/// -Returns: A tuple containing Color and its hexadecimal string
    func generateRandomHexColor() -> (color:Color, hex:String){
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        let color = Color(red: red, green: green, blue: blue)
        let redInt = Int(red*255)
        let greenInt = Int(green*255)
        let blueInt = Int(blue*255)
        
        let hexString = String(format: "#%02X%02X%02X", redInt,greenInt,blueInt)
        return (color, hexString)
    }
    func addColor(){

         
        let (newColor, newHex) = generateRandomHexColor()
        let newRecord = ColorRecord(color: newColor, hex: newHex,timeStamp: .now)
        modelContext.insert(newRecord)
        do{
            try modelContext.save()
        }catch{
            print("Failed to save color \(error.localizedDescription)")
        }
        }
    func deleteColor(_ record : ColorRecord){
        modelContext.delete(record)
        do{
            try modelContext.save()
        }catch {
            
                print("Failed to delete color \(error.localizedDescription)")
            }
        }
    }
    

    


#Preview {
   ContentView()
        .modelContainer(for: ColorRecord.self , inMemory: true)
}

