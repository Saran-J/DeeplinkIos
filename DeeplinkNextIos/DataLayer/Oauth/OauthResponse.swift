import Foundation
import ObjectMapper

class OauthResponse: Mappable {

    var accessToken: String?
    var expireAt: Int64?
    var expireIn: Int?
    
    required init?(map: Map) { }
    
    
    func mapping(map: Map) {
        accessToken <- map["accessToken"]
        expireAt <- map["expireAt"]
        expireIn <- map["expireIn"]
    }
}
