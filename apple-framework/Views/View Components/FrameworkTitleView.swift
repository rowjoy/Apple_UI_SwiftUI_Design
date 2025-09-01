//
//  FrameworkTitleView.swift
//  apple-framework
//
//  Created by Jamirul Islam on 1/9/25.
//

import SwiftUI

struct FrameworkTitleView : View {
    let framework : AppleFramework
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                
        }
        .padding()
    }
    
}

#Preview {
    FrameworkTitleView(framework: MockData.framework.first!)
}
