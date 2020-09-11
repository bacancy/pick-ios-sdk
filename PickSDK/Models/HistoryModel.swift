//
//  HistoryModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 10/3/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class HistoryModel: Model {
    public var rideToken: String = ""
    public var rideType: String = ""
    public var status: String = ""
    public var photo_url: String = ""
    public var auto: String = ""
    public var canceled: Bool = false
    public var cancelFee: CGFloat = 0
    public var started_at: Date? = Date(timeIntervalSince1970: 1)
    public var startAmount: CGFloat = 0
    public var waitAmount: CGFloat = 0
    public var tipAmount: CGFloat = 0
    public var endAmount: CGFloat = 0
    public var startName: String = ""
    public var stopName: String = ""
    public var endName: String = ""

    public var rate: UserRatingModel?
    public var driver: UserModel?
    public var payment: RidePaymentModel?

    public override func mapping(map: Map) {
        rideToken <- map["rideToken"]
        rideType <- map["rideType"]
        status <- map["status"]
        photo_url <- map["photo_url"]
        auto <- map["auto"]
        canceled <- map["canceled"]
        cancelFee <- map["cancelFee"]
        started_at <- (map["started_at"], DateTransform())
        startAmount <- map["startAmount"]
        waitAmount <- map["waitAmount"]
        tipAmount <- map["tipAmount"]
        endAmount <- map["endAmount"]
        startName <- map["startName"]
        stopName <- map["stopName"]
        endName <- map["endName"]
        rate <- map["rate"]
        driver <- map["driver"]
        payment <- map["payment"]
    }
}
