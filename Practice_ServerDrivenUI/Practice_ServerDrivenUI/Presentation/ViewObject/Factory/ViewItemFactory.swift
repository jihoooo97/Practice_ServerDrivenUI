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
        
        guard let viewData = viewItem.viewData else { return nil }
        
        switch viewType {
        case ViewType.textButton.rawValue:
            let textButton = TextButton()
            textButton.bind(data: viewData)
            return textButton
        case ViewType.oneTextLine.rawValue:
            let oneTextLineView = OneTextLineView()
            oneTextLineView.bind(data: viewData)
            return oneTextLineView
        case ViewType.twoTextLine.rawValue:
            let twoTextLineView = TwoTextLineView()
            twoTextLineView.bind(data: viewData)
            return twoTextLineView
        case ViewType.oneImage.rawValue:
            let oneImageView = OneImageView(frame: .zero)
            oneImageView.bind(data: viewData)
            return oneImageView
        default:
            return nil
        }
    }
    
}
