//
//  OneTextLineCell.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/31/24.
//

import UIKit

class OneTextLineCell: UITableViewCell, SDUCellable {
    
    private lazy var contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: ViewObject) {
        guard let oneTextLineData = data as? OneTextLineViewObject else { return }
        contentLabel.text = oneTextLineData.titleText
        contentLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    func setLayout() {
        self.addSubview(contentLabel)
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}


#Preview(traits: .defaultLayout) {
    ViewController()
}
