//
//  DemoItemDataSource.swift
//  SweetDataSourceDemo
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import SweetDataSource
import UIKit

class DemoItemDataSource: SingleTypeDataSource<DemoItemCell, UIViewController> {

    init(tableView: UITableView, selectionAction: @escaping (UIViewController) -> Void) {
        super.init(items: [
                    SingleTypeDataSourceViewController(),
                    CompoundDataSourceViewController(),
                   ],
                   tableView: tableView,
                   selectionAction: selectionAction)
    }

    override func registerCells(in tableView: UITableView) {
        // Override to no-op since this is handled by the storyboard
    }

    override func configureCell(cell: DemoItemCell, for item: UIViewController) {
        cell.titleLabel.text = String(describing: type(of: item))
            .replacingOccurrences(of: "ViewController", with: "")
            .camelCaseToSpacing()
    }
}
