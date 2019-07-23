//
//  ViewController.swift
//  DeeplinkNextIos
//
//  Created by Saran Jantara-amornporn on 22/7/2562 BE.
//  Copyright © 2562 Saran Jantara-amornporn. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button:UIButton!
    lazy var presenter = ViewControllerPresenter(self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickDeeplink() {
//        let urlString = "ktbnextuat://payment?orderid=0001&returnUrl=www.google.co.th"
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : false]) { (finish) in
//
//        }
        
        presenter.callOauthService()
    }
}

extension ViewController: ViewControllerProtocol {
    
}
