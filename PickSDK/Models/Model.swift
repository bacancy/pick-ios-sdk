//
//  Model.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 7/30/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

@objcMembers
open class Model: Mappable {
    public init() {
    }

    public required init?(map: Map) {
    }

    open func mapping(map: Map) {
    }
}
