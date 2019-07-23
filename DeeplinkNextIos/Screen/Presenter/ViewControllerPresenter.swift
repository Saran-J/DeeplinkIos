import Foundation
import Alamofire

protocol ViewControllerpresenterprotocol {
    func callOauthService()
}

class ViewControllerPresenter {
    
    var vc: ViewController?
    
    init(_ view: ViewController) {
        self.vc = view
    }
}

extension ViewControllerPresenter: ViewControllerpresenterprotocol {
    
    func callOauthService() {
        let url = "http://10.9.214.101:31151/v1/oauth/token"
        
        let header: [String: String] = [
            "Content-Type": "application/json",
            "X-Request-ID": "D7BEF5E871C3FD8EE5EDB85998566-14F8CAB9EB663E4538552D4F9F82D"
        ]
        
        let parameter: [String: String] = [
            "apiKey": "4b4de5ae15",
            "apiSecret": "30357229d5afce5f82b493166e324b44"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, headers: header).responseJSON { (resp) in
            print(resp)
        }
    }
}
