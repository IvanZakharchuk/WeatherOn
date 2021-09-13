//
//  UIViewController+Alert.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 13.09.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(
        title: String?,
        message: String? = nil,
        preferredStyle: UIAlertController.Style = .alert,
        actions: [UIAlertAction]? = [UIAlertAction(title: BaseTexts.ok.rawValue, style: .default, handler: nil)])
    {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        
        actions?.forEach { alertController.addAction($0) }
        self.present(alertController, animated: true, completion: nil)
    }
}
