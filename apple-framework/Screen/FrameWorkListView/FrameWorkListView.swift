//
//  FrameWorkListView.swift
//  apple-framework
//
//  Created by Jamirul Islam on 3/9/25.
//

import SwiftUI

struct FrameWorkListView: View {
    @StateObject var viewModel = FrameworkViewModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(MockData.framework){ framework in
                    NavigationLink (destination: FrameworkDetaliView(isShowingDetailView: $viewModel.isShowingDetailView, framework: framework)){
                        FameworkHstackView(framework: framework)
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
       
    }
}

#Preview {
    FrameWorkListView()
}
