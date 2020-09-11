//
//  TokenizeModel.swift
//  PickSDK
//
//  Created by Howard Cantrell on 2/13/20.
//  Copyright © 2020 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class TokenizeModel: Model {
    public var Error: String? = nil
    public var Success: Bool = false
    public var ReferenceNumber: String? = nil
    public var Token: String? = nil
    public var TokenHMAC: String? = nil

    public override func mapping(map: Map) {
        Error <- map["Error"]
        Success <- map["Success"]
        ReferenceNumber <- map["ReferenceNumber"]
        Token <- map["Token"]
        TokenHMAC <- map["TokenHMAC"]
    }
}
