//
//  ViewController.swift
//  Practice_ServerDrivenUI
//
//  Created by 유지호 on 1/30/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var sduTableView = SDUTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .white
        setTableView()
        setLayout()
    }
    
    private func setTableView() {
        let data = Data(jsonData.utf8)
        guard let parsedData = try? JSONDecoder().decode(SDUEntity.self, from: data)
        else {
            print("parsing fail")
            return
        }
        
        sduTableView = {
            let tableView = SDUTableView(
                viewController: self,
                items: parsedData.viewItems
            )
            return tableView
        }()
    }
    
    private func setLayout() {
        view.addSubview(sduTableView)
        
        sduTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sduTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sduTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sduTableView.topAnchor.constraint(equalTo: view.topAnchor),
            sduTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}


#Preview(traits: .defaultLayout) {
    ViewController()
}
