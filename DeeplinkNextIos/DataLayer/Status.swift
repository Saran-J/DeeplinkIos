import Foundation
import ObjectMapper

class Status: Mappable {
    
    var code: String?
    var message: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}
