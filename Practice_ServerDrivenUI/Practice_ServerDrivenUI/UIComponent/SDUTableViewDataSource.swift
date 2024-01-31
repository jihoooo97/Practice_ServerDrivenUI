//
//  SDUTableViewDataSource.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/30/24.
//

import UIKit

class SDUTableViewDataSource: NSObject, UITableViewDataSource {
    
    var items: [ViewItem]
    
    init(items: [ViewItem]) {
        self.items = items
        super.init()
    }
    
    deinit {
        print("dataSource deinit")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = CellFactory.makeCell(
            tableView: tableView,
            indexPath: indexPath,
            viewItem: items[indexPath.row]
        )
        else {
            return UITableViewCell()
        }
        return cell
    }
    
}
