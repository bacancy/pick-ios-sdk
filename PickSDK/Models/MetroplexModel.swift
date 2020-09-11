//
//  MetroplexModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 4/25/19.
//  Copyright © 2019 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class MetroplexModel: Model {
    public var defaultAreaId: Int = 0
    public var areas: [AreaModel]?

    public override func mapping(map: Map) {
        super.mapping(map: map)

        defaultAreaId <- map["defaultAreaId"]
        areas <- map["areas"]
    }
}
