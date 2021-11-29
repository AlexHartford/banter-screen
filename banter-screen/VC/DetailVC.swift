//
//  DetailVC.swift
//  banter-screen
//
//  Created by Top Dev on 10/6/21.
//

import UIKit

class DetailVC: UIViewController {

    var pageTitle: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        self.title = pageTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
}
