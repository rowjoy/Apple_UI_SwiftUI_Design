//
//  FrameworkViewModel.swift
//  apple-framework
//
//  Created by Jamirul Islam on 31/8/25.
//

import SwiftUI

final class FrameworkViewModel: ObservableObject {
    var selectedFramework: AppleFramework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
    let columns : [GridItem] = [ GridItem(.flexible()) , GridItem(.flexible()), GridItem(.flexible())]
    
}
