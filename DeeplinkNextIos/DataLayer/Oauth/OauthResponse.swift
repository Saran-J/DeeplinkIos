import Foundation
import ObjectMapper

class OauthResponse: Mappable {
    
    var result: ResultOauth?
    var status: Status?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        result <- map["result"]
        status <- map["status"]
    }
}

class ResultOauth: Mappable {

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
