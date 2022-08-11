//
//  ContentView.swift
//  RGB
//
//  Created by Azamat Kenjebayev on 12/17/21.
//

import SwiftUI

struct ContentView: View {
    @State var redPicker: Double = 0.5
    @State var greenPicker: Double = 0.5
    @State var bluePicker: Double = 0.5
    var body: some View {
        ZStack{
            VStack{
        Text("Play around with sliders!")
            .padding()
                Slider(value: $redPicker)
                Slider(value: $greenPicker)
                Slider(value: $bluePicker)
                Color(red: redPicker, green: greenPicker, blue: bluePicker)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
