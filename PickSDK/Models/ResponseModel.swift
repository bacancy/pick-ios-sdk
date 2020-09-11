//
//  ResponseModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 8/22/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class ResponseModel<T: Model>: Model, ApiModel {
    public var code: Int = 0
    public var message: String = ""
    public var errors: [String: [String]] = [:]
    public var success: Bool = false
    public var data: T?

    public override func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        errors <- map["errors"]
        success <- map["success"]
        data <- map["data"]
    }
}
