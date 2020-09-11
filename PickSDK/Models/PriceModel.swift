//
//  PriceModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/18/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class PriceModel: Model {
    public var priceToken: String = ""
    public var rideType: String = ""
    public var capacity: Int = 0
    public var baseFare: CGFloat = 0
    public var bookingFee: CGFloat = 0
    public var minimumFare: CGFloat = 0
    public var perMinute: CGFloat = 0
    public var perMile: CGFloat = 0
    public var waitTime: CGFloat = 0
    public var cancelFee: CGFloat = 0
    public var totalFare: CGFloat = 0
    public var headerText: String = ""
    public var footerText: String = ""
    public var leftText: String = ""
    public var rightText: String = ""

    public override func mapping(map: Map) {
        priceToken <- map["priceToken"]
        rideType <- map["rideType"]
        capacity <- map["capacity"]
        baseFare <- map["baseFare"]
        bookingFee <- map["bookingFee"]
        minimumFare <- map["minimumFare"]
        perMinute <- map["perMinute"]
        perMile <- map["perMile"]
        waitTime <- map["waitTime"]
        cancelFee <- map["cancelFee"]
        totalFare <- map["totalFare"]
        headerText <- map["headerText"]
        footerText <- map["footerText"]
        leftText <- map["leftText"]
        rightText <- map["rightText"]
    }
}
