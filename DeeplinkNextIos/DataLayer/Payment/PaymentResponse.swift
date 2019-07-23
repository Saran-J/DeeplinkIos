import Foundation
import ObjectMapper

class PaymentResponse: Mappable {
    
    var result: ResultPayment?
    var status: Status?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        result <- map["result"]
        status <- map["status"]
    }
}

class ResultPayment: Mappable {
    
    var deeplinkUrl: String?
    var expiryAt: Int64?
    var expiryIn: Int?
    var transactionId: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        deeplinkUrl <- map["deeplinkUrl"]
        expiryAt <- map["expiryAt"]
        expiryIn <- map["expiryIn"]
        transactionId <- map["transactionId"]
    }
}
