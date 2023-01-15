import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack {
                ColorScreenView(red: red, green: green, blue: blue)
                
                SliderView(value: $red, color: .red)
                SliderView(value: $green, color: .green)
                SliderView(value: $blue, color: .blue)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

//MARK: - SliderView

struct SliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(color)
            Spacer()
            Slider(value: $value, in: 0...255, step: 1)
                .frame(width: 320)
                .accentColor(color)
        }
    }
}


//MARK: - ColorScreenView

struct ColorScreenView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(
            red: red/255,
            green: green/255,
            blue: blue/255
        )
        .frame(height: 200)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(Color.mint, lineWidth: 3)
        }
        .padding(.bottom)
    }
}

