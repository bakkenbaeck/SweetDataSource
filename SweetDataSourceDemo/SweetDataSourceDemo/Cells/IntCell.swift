//
//  IntCell.swift
//  SweetDataSourceDemo
//
//  Created by Ellen Shapiro (Work) on 4/20/18.
//  Copyright © 2018 Bakken & Bæck. All rights reserved.
//

import UIKit

public class IntCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])

        return label
    }()
}
