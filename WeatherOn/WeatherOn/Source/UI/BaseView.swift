//
//  BaseView.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 13.09.2021.
//

import Foundation
import UIKit

protocol RootViewGetable {

    associatedtype RootView
    var rootView: RootView? { get }
}

extension RootViewGetable where Self: UIViewController, RootView: UIView {
    var rootView: RootView? {
        return self.view as? RootView
    }
}

class BaseView<ViewEvents>: UIView {
    
    public var eventHandler: EventHandler<ViewEvents>? = nil
    
    func setupView() {
        
    }
}
