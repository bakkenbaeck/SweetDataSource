//
//  ViewController.swift
//  SweetDataSourceDemo
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit
import SweetDataSource

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    private var dataSource: DemoItemDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Data Source Examples"

        self.dataSource = DemoItemDataSource(tableView: self.tableView, selectionAction: { viewController in
            self.navigationController?.pushViewController(viewController, animated: true)
        })
    }
}

