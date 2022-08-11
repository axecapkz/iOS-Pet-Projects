//
//  ContentView.swift
//  NavScreen
//
//  Created by Azamat Kenjebayev on 3/3/22.
//

import SwiftUI


struct NavigationShowCase: View {
    var body: some View {
        passingData
    }
    
    @State var showSecondView = false

    var showProgrammatically: some View {
        NavigationView {
            VStack{
                NavigationLink(isActive: $showSecondView){
                    SecondView()
                } label: {
                    EmptyView()
                }
                Button {
                    showSecondView = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 16).fill(Color.yellow).frame(height: 52)
                    Text("Hit me and I will navigate")
                    }
                    .padding()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    showSecondView = true
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("First View")
        }
    }
    
    var passingData: some View {
        NavigationView {
            VStack(spacing: 30){
            Text("You're going to flip a coin")
                NavigationLink(destination: ResultView(choice: "Heads")){
                    Text("Heads")
                }
                NavigationLink(destination: ResultView(choice: "Tails")){
                    Text("Tails")
                }
            }
            .padding()
        }
    }
}

struct ResultView: View {
    var choice: String
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()){
                    Text("Hello, world!")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("First View")
        }
    }
}
struct SecondView: View {
    @State var showSheet = false
    
    var body: some View {
        VStack{
            Color.yellow.edgesIgnoringSafeArea(.all)
            Button("This is a second view"){
               showSheet = true
            }
        }
        .sheet(isPresented: $showSheet){
            SecondView(showSheet: showSheet)
        }
        
    }
}

struct ThirdView: View {
    var body: some View {
        NavigationLink(destination: ContentView()){
        Text("This is a third view")
            .navigationTitle("Third View")
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationShowCase()
//        GeometryReaderCase()
    }
}

