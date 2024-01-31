//
//  CellFactory.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

class CellFactory {
    
    public static func makeCell(
        tableView: UITableView,
        indexPath: IndexPath,
        viewItem: ViewItem
    ) -> SDUCellable? {
        guard let viewTypeID = viewItem.viewType,
              let viewObject = viewItem.viewObject
        else {
            return nil
        }
        
        switch viewTypeID {
        case ViewType.oneTextLine.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: viewTypeID, for: indexPath) as! OneTextLineCell
            cell.bind(data: viewObject)
            return cell
            
        case ViewType.twoTextLine.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: viewTypeID, for: indexPath) as! TwoTextLineCell
            cell.bind(data: viewObject)
            return cell
            
        case ViewType.oneImage.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: viewTypeID, for: indexPath) as! OneImageCell
            cell.bind(data: viewObject)
            return cell
            
        default:
            return nil
        }
    }
    
}
