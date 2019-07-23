//        ktbnextuat://next.ktb.co.th/payment?orderid=0001&returnUrl=www.google.co.th

import UIKit

protocol ViewControllerProtocol {
    func getToken(token: String)
    func goToNEXTuat()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button:UIButton!
    lazy var presenter = ViewControllerPresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickDeeplink() {
        presenter.callOauthService()
    }
}

extension ViewController: ViewControllerProtocol {
    
    func getToken(token: String) {
        presenter.callPaymentService(token: token)
    }
    
    func goToNEXTuat() {
        let linkToAppStore = "ktbnextuat://"
        
        if let url = URL(string: linkToAppStore), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : false], completionHandler: {(success: Bool) in
                if success {
                    
                    print("\(url) launced successfully")
                }})
        }
    }
}
