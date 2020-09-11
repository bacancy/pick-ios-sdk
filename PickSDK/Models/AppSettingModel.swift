//
//  AppSettingModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class AppSettingModel: Model {
    public var updateUrl: String = ""
    public var rateUrl: String = ""
    public var driverAppUrl: String = ""
    public var moneyAppUrl: String = ""
    public var updateNag: Bool = false
    public var updateForce: Bool = false

    public override func mapping(map: Map) {
        updateUrl <- map["updateUrl"]
        rateUrl <- map["rateUrl"]
        driverAppUrl <- map["driverAppUrl"]
        moneyAppUrl <- map["moneyAppUrl"]
        updateNag <- map["updateNag"]
        updateForce <- map["updateForce"]
    }
}