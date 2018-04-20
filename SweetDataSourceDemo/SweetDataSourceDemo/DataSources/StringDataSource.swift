//
//  StringDataSource.swift
//  SweetDataSourceDemo
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit
import SweetDataSource

class StringDataSource: SingleTypeDataSource<StringCell, String> {

    private let title: String?

    init(tableView: UITableView,
         selectionAction: @escaping (String) -> Void,
         title: String? = nil) {
        self.title = title
        super.init(items: [
            "Checking",
            "Out",
            "Generic",
            "And",
            "Compounding",
            "Data",
            "Sources",
        ],
        tableView: tableView,
        selectionAction: selectionAction)
    }

    override func registerCells(in tableView: UITableView) {
        tableView.registerNib(forCellType: StringCell.self)
    }

    override func configureCell(cell: StringCell, for item: String) {
        cell.titleLabel.text = item
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if title != nil {
            return UITableViewAutomaticDimension
        } else {
            return super.tableView(tableView, heightForHeaderInSection: section)
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "I'm a custom footer!"
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = self.tableView(tableView, titleForFooterInSection: section)
        label.textColor = .red
        label.backgroundColor = .green
        return label
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if title != nil {
            return UITableViewAutomaticDimension
        } else {
            return super.tableView(tableView, heightForFooterInSection: section)
        }
    }
}
