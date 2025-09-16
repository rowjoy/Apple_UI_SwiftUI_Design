//
//  KeyboardObserver.swift
//  apple-framework
//
//  Created by Jamirul Islam on 14/9/25.
//

import SwiftUI
import Combine


final class KeyboardObserver: ObservableObject {
    @Published var isKeyboardVisible = false
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
            let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true }
            let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }

            willShow.merge(with: willHide)
                .assign(to: \.isKeyboardVisible, on: self)
                .store(in: &cancellables)
        }
    
    
}
