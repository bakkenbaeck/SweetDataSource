//
//  CompoundDataSourceViewController.swift
//  SweetDataSourceDemo
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import SweetDataSource
import UIKit

class CompoundDataSourceViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    private var stringDataSource: StringDataSource!
    private var intDataSource: IntDataSource!
    private var compoundDataSource: CompoundDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        }

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])

        stringDataSource = StringDataSource(tableView: tableView, selectionAction: { [weak self] string in
            self?.compoundDataSource.deselectSelectedRow()
            print("Tapped: \(string)")
        }, title: "Strings")

        intDataSource = IntDataSource(tableView: tableView, selectionAction: { [weak self] integer in
            self?.compoundDataSource.deselectSelectedRow()
            self?.intDataSource.printSelected(integer: integer)
        }, title: "Ints")

        compoundDataSource = CompoundDataSource(dataSources: [
            stringDataSource,
            intDataSource,
        ], tableView: tableView)
    }
}
