//
//  FrameworkGridView.swift
//  apple-framework
//
//  Created by Jamirul Islam on 31/8/25.
//
// https://youtu.be/b1oC7sLIgpI?si=SuM_IfcQ0RQI7A3i
// 2:59:51 
import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkViewModel()
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: viewModel.columns,){
                    ForEach(MockData.framework, id: \.id,) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetaliView(isShowingDetailView: $viewModel.isShowingDetailView, framework: viewModel.selectedFramework ?? MockData.framework.first!)
            }
        }
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}



