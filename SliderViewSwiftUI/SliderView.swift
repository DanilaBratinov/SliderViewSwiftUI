import SwiftUI

struct SliderView: View {
    @Binding var red: Double
    var body: some View {
        Slider(value: $red)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(red: Double)
    }
}
