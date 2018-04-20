//
//  UITableViewCell+DefaultValues.swift
//  SweetDataSource
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

public extension UITableViewCell {

    /// A default reuse identifier based on the cell's class.
    public static var defaultReuseIdentifier: String {
        return String(describing: type(of: self))
    }

    /// Gets a nib with a name matching that of the cell's class.
    /// - Parameters:
    ///    - bundle: The bundle to grab the nib from.
    public static func defaultNib(inBundle bundle: Bundle = Bundle.main) -> UINib {
        let nibName = String(describing: self)
        let components = nibName.components(separatedBy: ".")
        guard let className = components.last else {
            fatalError("Could not get class name from components")
        }

        return UINib(nibName: className, bundle: bundle)
    }
}
