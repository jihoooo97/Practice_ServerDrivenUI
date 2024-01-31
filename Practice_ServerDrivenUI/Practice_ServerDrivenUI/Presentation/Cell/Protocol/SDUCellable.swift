//
//  CellProtocol.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

protocol SDUCellable: UITableViewCell {
    func bind(data: ViewObject)
    func setLayout()
}
