//
//  OneTextLineView.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import UIKit

class OneTextLineView: UIView, ViewItemable {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: ViewObject) {
        guard let oneTextLineData = data as? OneTextLineViewObject else {
            print("OneTextView parse error")
            return
        }
        titleLabel.text = oneTextLineData.titleText
    }
    
    func setLayout() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
