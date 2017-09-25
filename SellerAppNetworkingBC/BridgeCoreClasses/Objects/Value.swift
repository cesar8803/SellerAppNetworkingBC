import Foundation
import ObjectMapper

public class Value: Mappable{
    public var number: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        number <- map["number"]
    }
}
