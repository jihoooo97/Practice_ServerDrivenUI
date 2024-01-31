//
//  TextButton.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

protocol ViewItemable: UIView {
    func bind(data: ViewObject)
    func setLayout()
}

class TextButton: UIButton, ViewItemable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: ViewObject) {
        guard let textButtonData = data as? TextButtonViewObject else {
            print("text button parse error")
            return
        }
        
        setTitle(textButtonData.titleText, for: .normal)
    }
    
    func setLayout() {
        backgroundColor = .blue
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
