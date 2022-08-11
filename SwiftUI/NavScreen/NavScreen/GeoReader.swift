import SwiftUI

struct GeometryReaderCase: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0){
                Text("Left")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.33)
                    .background(Color.yellow)
                Text("Right")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: geometry.size.width * 0.67)
                    .background(Color.orange)
            }
            .onTapGesture {
                print(geometry.size)
            }
        }
        .frame(height: 50)
        .padding()
    }
}
