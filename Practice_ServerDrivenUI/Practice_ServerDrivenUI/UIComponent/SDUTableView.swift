//
//  SDUTableView.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/30/24.
//

import UIKit

class SDUTableView: UITableView {
        
    var customDataSource: SDUTableViewDataSource!
    
    convenience init(viewController: UIViewController, items: [ViewItem]) {
        self.init(frame: .zero, style: .plain)
        self.backgroundColor = .white
        registerCells(viewController)
        setDatasource(items)
    }
    
    func registerCells(_ viewController: UIViewController) {
        register(OneTextLineCell.self, forCellReuseIdentifier: ViewType.oneTextLine.rawValue)
        register(TwoTextLineCell.self, forCellReuseIdentifier: ViewType.twoTextLine.rawValue)
        register(OneImageCell.self, forCellReuseIdentifier: ViewType.oneImage.rawValue)
    }
    
    func setDatasource(_ items: [ViewItem]) {
//       let customDataSource = SDUTableViewDataSource(items: items) -> 이 메서드에서 벗어나면 바로 deinit 된다.
        customDataSource = SDUTableViewDataSource(items: items)
        self.dataSource = customDataSource
    }
    
}
