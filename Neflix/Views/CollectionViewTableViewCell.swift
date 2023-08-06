//
//  CollectionViewTableViewCell.swift
//  Neflix
//
//  Created by 김하람 on 2023/08/06.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
