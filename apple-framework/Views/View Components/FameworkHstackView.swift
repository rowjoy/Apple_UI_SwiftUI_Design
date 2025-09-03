import SwiftUI





struct FameworkHstackView : View {
    let framework : AppleFramework
    var body: some View {
        
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        
    }
}



#Preview {
    FameworkHstackView(framework: MockData.framework.first!)
}
