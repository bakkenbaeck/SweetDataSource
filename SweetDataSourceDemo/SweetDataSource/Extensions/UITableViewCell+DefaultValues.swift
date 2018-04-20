//
//  UITableViewCell+DefaultValues.swift
//  SweetDataSource
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

public extension UITableViewCell {

    private static var className: String {
        let fullDescription = String(describing: self)

        // Description comes out as Framework.ClassName - just grab the class name
        let components = fullDescription.components(separatedBy: ".")
        guard let className = components.last else {
            fatalError("Could not get class name from components")
        }

        return className
    }

    /// A default reuse identifier based on the cell's class.
    public static var defaultReuseIdentifier: String {
        return self.className
    }

    /// Gets a nib with a name matching that of the cell's class.
    /// - Parameters:
    ///    - bundle: The bundle to grab the nib from.
    public static func defaultNib(inBundle bundle: Bundle = Bundle.main) -> UINib {
        return UINib(nibName: self.className, bundle: bundle)
    }
}
