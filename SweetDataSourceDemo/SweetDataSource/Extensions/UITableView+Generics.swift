//
//  UITableView+Generics.swift
//  SweetDataSource
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

public extension UITableView {

    public func registerCell<CellType: UITableViewCell>(of type: CellType.Type) {
        register(type, forCellReuseIdentifier: type.defaultReuseIdentifier)
    }

    public func registerNib<CellType: UITableViewCell>(forCellType type: CellType.Type, using bundle: Bundle = Bundle(for: CellType.self)) {
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

    public func deselectSelectedRow(animated: Bool = true) {
        guard let selectedIndexPath = self.indexPathForSelectedRow else { /* nothing to deselect */ return }

        self.deselectRow(at: selectedIndexPath, animated: animated)
    }
}
