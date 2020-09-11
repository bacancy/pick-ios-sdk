//
//  StageModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 04/20/20, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2020 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class StageModel: Model {
    public var profile: String = ""
    public var terms: String = ""
    public var payment: String = ""
    public var uploaded: String = ""
    public var reviewed: String = ""
    public var mvr: String = ""
    public var background: String = ""

    public override func mapping(map: Map) {
        profile <- map["profile"]
        terms <- map["terms"]
        payment <- map["payment"]
        uploaded <- map["uploaded"]
        reviewed <- map["reviewed"]
        mvr <- map["mvr"]
        background <- map["background"]
    }
}