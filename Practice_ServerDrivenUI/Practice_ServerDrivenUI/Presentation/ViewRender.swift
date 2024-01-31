//
//  ViewRender.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import UIKit

class ViewRender {
    
    func rendering() -> [UIView] {
        let data = Data(jsonData.utf8)
        guard
            let parsedData = try? JSONDecoder().decode(SDUEntity.self, from: data)
        else {
            return []
        }
        
        return parsedData.viewItems.map {
            return ViewItemFactory.makeView(viewItem: $0) ?? .init()
        }
    }
    
}
