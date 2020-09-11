//
//  TokenModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/15/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class TokenModel: Model {
    public var token: String? = ""

    public override func mapping(map: Map) {
        token <- map["token"]
    }
}
