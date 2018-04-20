//
//  UITableView+Generics.swift
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
        let nibName = String(describing: type(of: self))
        return UINib(nibName: nibName, bundle: bundle)
    }
}

public extension UITableView {

    public func registerCell<CellType: UITableViewCell>(of type: CellType.Type) {
        register(type, forCellReuseIdentifier: type.defaultReuseIdentifier)
    }

    public func registerNib<CellType: UITableViewCell>(forCellType type: CellType.Type, using bundle: Bundle = Bundle.main) {
        let nib = type.defaultNib(inBundle: bundle)
        register(nib, forCellReuseIdentifier: type.defaultReuseIdentifier)
    }

    public func dequeueCell<CellType: UITableViewCell>(of type: CellType.Type, for indexPath: IndexPath) -> CellType {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.defaultReuseIdentifier, for: indexPath) as? CellType else {
            fatalError("Couldn't dequeue a cell of type \(type) for Index Path \(indexPath)")
        }

        return cell
    }

    public func dequeueCell<CellType: UITableViewCell>(of type: CellType.Type) -> CellType {
        if let cell = self.dequeueReusableCell(withIdentifier: type.defaultReuseIdentifier) as? CellType {
            return cell
        } else {
            return type.init()
        }
    }
}
