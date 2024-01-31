//
//  ViewItemFactory.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import UIKit

class ViewItemFactory {
    
    public static func makeView(viewItem: ViewItem) -> UIView? {
        let viewType = viewItem.viewType
        
        guard let viewObject = viewItem.viewObject else { return nil }
        
        switch viewType {
        case ViewType.textButton.rawValue:
            let textButton = TextButton()
            textButton.bind(data: viewObject)
            return textButton
        case ViewType.oneTextLine.rawValue:
            let oneTextLineView = OneTextLineView()
            oneTextLineView.bind(data: viewObject)
            return oneTextLineView
        case ViewType.twoTextLine.rawValue:
            let twoTextLineView = TwoTextLineView()
            twoTextLineView.bind(data: viewObject)
            return twoTextLineView
        default:
            return nil
        }
    }
    
}
