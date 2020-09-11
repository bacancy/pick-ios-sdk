//
//  TokenexModel.swift
//  PickSDK
//
//  Created by Howard Cantrell on 2/13/20.
//  Copyright © 2020 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class TokenexModel: Model {
    public var tokenexid: String = ""
    public var timestamp: String = ""
    public var authenticationKey: String = ""
    public var data: String = ""
    public var tokenScheme: String = ""

    public override func mapping(map: Map) {
        tokenexid <- map["tokenexid"]
        timestamp <- map["timestamp"]
        authenticationKey <- map["authenticationKey"]
        data <- map["data"]
        tokenScheme <- map["tokenScheme"]
    }
}
