//
//  TwoTextLineView.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 2/1/24.
//

import UIKit

class TwoTextLineView: UIView, ViewItemable {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .green
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
    
    func bind(data: ViewData) {
        guard let twoTextLineData = data as? TwoTextLineViewData else { return }
        titleLabel.text = twoTextLineData.titleText
        contentLabel.text = twoTextLineData.contentText
    }
    
    func setLayout() {
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}
