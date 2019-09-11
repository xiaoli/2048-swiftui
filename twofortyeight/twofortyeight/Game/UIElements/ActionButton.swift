import SwiftUI

struct ActionButton: View {
    let title: String
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(title)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding(12)
            .background(Color(white: 0.3))
            .cornerRadius(6)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "NEW GAME") { }
    }
}