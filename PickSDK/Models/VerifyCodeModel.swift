//
//  VerifyCodeModel.swift
//  Alamofire
//
//  Created by Erik Rodriguez on 2/15/20.
//

import UIKit
import ObjectMapper

public class VerifyCodeModel: Model {
    public var hasPassword: Bool = false
    public var trouble: String = ""

    public override func mapping(map: Map) {
        hasPassword <- map["has_password"]
        trouble <- map["trouble"]
    }
}
