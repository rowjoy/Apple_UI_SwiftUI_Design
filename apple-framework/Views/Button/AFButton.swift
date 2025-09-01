//
//  AFButton.swift
//  apple-framework
//
//  Created by Jamirul Islam on 31/8/25.
//

import SwiftUI

struct AFButton: View {
    var title : String
    var body: some View {
        Text(title)
             .font(.title2)
             .fontWeight(.semibold)
             .frame(maxWidth: .infinity, maxHeight: 45, alignment: .center)
             .background(
                 RoundedRectangle(cornerRadius: 5)
                     .fill(Color.red )
             )
             .foregroundColor(.white)
             .padding(.all)

    }
}

#Preview {
    AFButton(title: "Learn More")
}
