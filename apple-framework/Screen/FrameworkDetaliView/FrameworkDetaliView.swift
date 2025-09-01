//
//  FrameworkDetaliView.swift
//  apple-framework
//
//  Created by Jamirul Islam on 31/8/25.
//

import SwiftUI

struct FrameworkDetaliView: View {
    @Binding var  isShowingDetailView : Bool
    @State private var isSafariView : Bool = false
    var framework: AppleFramework
    var body: some View {
        VStack {
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            Spacer()
            FrameworkTitleView(framework: framework)
             Text(framework.description)
                 .font(.body)
                 .padding()
             Spacer()
             Button {
                 isSafariView = true
             } label: {
                 AFButton(title: "Learn More")
             }
        }
        .fullScreenCover(isPresented: $isSafariView , content: {
            SafariView(url: URL(string: framework.urlString)!)
        })
    }
}

#Preview {
    FrameworkDetaliView(
        isShowingDetailView: .constant(false), framework: MockData.framework[0]
    )
}
