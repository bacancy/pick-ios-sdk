//
//  AreaModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class AreaModel: Model {
    public var areaId: Int = 0
    public var name: String = ""

    public override func mapping(map: Map) {
        areaId <- map["areaId"]
        name <- map["name"]
    }
}
