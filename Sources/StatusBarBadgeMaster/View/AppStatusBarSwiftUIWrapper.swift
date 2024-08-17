//
//  AppStatusBarSwiftUIWrapper.swift
//
//
//  Created by Pavel Moslienko on 17.08.2024.
//

import SwiftUI
import UIKit

struct AppStatusBarSwiftUIWrapper: UIViewRepresentable {
    var icon: UIImage?
    var title: String
    
    init(icon: UIImage?, title: String) {
        self.icon = icon
        self.title = title
    }
    
    func makeUIView(context: Context) -> UIView {
        AppStatusBarView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        (uiView as? AppStatusBarView)?.configure(icon: icon, title: title)
    }
}
