//
//  PaymentModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/15/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class PaymentModel: Model {
    public var paymentType: String = ""
    public var isDefault: Bool = false
    public var imageUrl: String = ""
    public var token: String = ""
    public var expirationMonth: String = ""
    public var expirationYear: String = ""
    public var last4: String = ""
    public var cardType: String = ""
    public var expired: Bool = false
    public var email: String = ""

    public override func mapping(map: Map) {
        paymentType <- map["paymentType"]
        isDefault <- map["isDefault"]
        imageUrl <- map["imageUrl"]
        token <- map["token"]
        expirationMonth <- map["expirationMonth"]
        expirationYear <- map["expirationYear"]
        last4 <- map["last4"]
        cardType <- map["cardType"]
        expired <- map["expired"]
        email <- map["email"]
    }
}
