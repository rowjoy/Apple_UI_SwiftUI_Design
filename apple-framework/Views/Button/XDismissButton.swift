//
//  XDismissButton.swift
//  apple-framework
//
//  Created by Jamirul Islam on 1/9/25.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowingDetailView: Bool
    var body: some View {
        HStack {
            Spacer()
            Button{
                isShowingDetailView = false
                print("\(isShowingDetailView)")
             }
              label: {
                 Image(systemName: "xmark")
                      .foregroundColor(Color(.label))
                      .imageScale(.large)
                      .frame(width: 44, height: 44)
                  
                      
              }
        }
        .padding()

    }
}

#Preview {
    XDismissButton(isShowingDetailView: .constant(false))
}
