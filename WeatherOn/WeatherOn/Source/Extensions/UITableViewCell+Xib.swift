//
//  UITableViewCell+Xib.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 13.09.2021.
//

import Foundation
import UIKit

extension UITableView {

    func register(cell: AnyClass) {
        let nib = UINib(nibName: toString(cell), bundle: nil)
        self.register(nib, forCellReuseIdentifier: toString(cell))
    }
    
    public func dequeueReusableCell<Result>(cellClass: Result.Type, for indexPath: IndexPath) -> Result
        where Result: UITableViewCell
    {
        let cell = self.dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)

        guard let value = cell as? Result else {
            fatalError("Dont find identifire")
        }

        return value
    }
}

extension UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
