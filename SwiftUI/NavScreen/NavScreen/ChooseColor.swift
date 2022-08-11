//
//  ChooseColor.swift
//  NavScreen
//
//  Created by Azamat Kenjebayev on 3/4/22.
//

import SwiftUI

struct ChooseColor: View {
    @State private var showingOptions = false
    @State private var selection = "None"
    let colors = ["Red", "Blue", "Green", "Yellow", "Teal"]
    
    var body: some View {
        VStack{
            picker
            Spacer()
//            Text(selection)
            Button("Please choose your color"){
                showingOptions = true
            }
            .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .hidden){
                Button("Red"){
                    selection = "Red"
                    print("Red")
                }
                Button("Blue"){
                    selection = "Blue"
                    print("Blue")
                }
                Button("Green"){
                    selection = "Green"
                    print("Green")
                }
                Button("Yellow"){
                    selection = "Yellow"
                    print("Yellow")
                }
                Button("Teal"){
                    selection = "Teal"
                    print("Teal")
                }
            }
            .padding()
            .frame(height: UIScreen.main.scale * 17)
            .background(.ultraThinMaterial).foregroundColor(.teal)
            .foregroundColor(.white)
            .cornerRadius(16)
            .clipShape(Capsule())
        }
        .background(colorToShow)
    }
    
    var colorToShow: Color {
        switch selection {
        case "Red":
            return .red
        case "Blue":
            return .blue
        case "Green":
            return .green
        case "Yellow":
            return .yellow
        case "Teal":
            return .teal
        default:
            return .clear
        }
    }
    
    var picker: some View {
        VStack{
            Picker("Select a color", selection: $selection){
                ForEach(colors, id: \.self){
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
//            Text("Selected color: \(selection)")
        }
    }
}

struct ChooseColor_Previews: PreviewProvider {
    static var previews: some View {
        ChooseColor()
    }
}
