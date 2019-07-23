import Foundation
import Alamofire
import ObjectMapper
import CryptoSwift

protocol ViewControllerpresenterprotocol {
    func callOauthService()
    func callPaymentService(token: String)
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
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header).responseJSON { (resp) in
            print(resp.result.value)
            guard let modelMapper = Mapper<OauthResponse>().map(JSONObject: resp.result.value) else { return }
            guard let token = modelMapper.result?.accessToken else { return }
            self.vc?.getToken(token: token)
        }
    }
    
    func callPaymentService(token: String) {
        let partnerToken = encryptPartnerToken()
        
        print("partnerToken", partnerToken)
        
        let url = "http://10.9.214.101:31152/v1/payment/deeplink"
        
        let header: [String: String] = [
            "Content-Type": "application/json",
            "X-Request-ID": "D7BEF5E871C3FD8EE5EDB85998566-14F8CAB9EB663E4538552D4F9F82D",
            "Authorization": "Bearer " + token
        ]
        
        let parameter: [String: String] = [
            "amount": "15000",
            "extraData": "",
            "fee": "0",
            "partnerToken": partnerToken,
            "reference1": "08903331714",
            "reference2": "1685562684887441",
            "reference3": "",
            "returnUrl": "{Partner.App.URI.Scheme}://payment/callback",
            "shopNameEn": "",
            "shopNameTh": ""
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, headers: header).responseJSON { (resp) in
            print(resp.result.value)
//            guard let modelMapper = Mapper<PaymentResponse>().map(JSONObject: resp.result.value) else { return }
            self.vc?.goToNEXTuat()
        }
    }
    
    func encryptPartnerToken() -> String {
        var result = ""
        do {
            var key = "6EC77FB50566B4DB6EC77FB50566B4DB"
            var iv = "A4628E5F5CC98BF5"
            let aes = try AES(key: Array(key.utf8), iv: Array(iv.utf8) , blockMode: .CBC, padding: .pkcs5)
            let unixTime = Int64(Date().timeIntervalSince1970)
            let partnerObject: [String: Any] = [
                "reference1" : "abcdefg",
                "payment_init_time" : unixTime
            ]
            
            print("partnerObject",partnerObject)
            let partnerData = try JSONSerialization.data(withJSONObject: partnerObject, options: [])
            
            let partnerString = String(data: partnerData, encoding: .utf8)
            
            guard let partnerStrings = partnerString else { return "" }
            
            result = try aes.encrypt(partnerStrings.utf8.map {$0}).toBase64() ?? ""
        } catch {
            
        }
        return result
    }
}
