//
//  ReferrerModel.swift
//  PickSDK
//
//  Created by Erik Rodriguez on 2/4/20.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class ReferrerModel: Model {
    public var repId: String = ""
    public var name: String = ""
    public var title: String = ""
    public var url: String = ""
    public var phoneNumber: String = ""

    public override func mapping(map: Map) {
        repId <- map["RepId"]
        name <- map["RepName"]
        title <- map["RepTitleDescr"]
        url <- map["RepURL"]
        phoneNumber <- map["RepPhoneNumber"]
    }
}
