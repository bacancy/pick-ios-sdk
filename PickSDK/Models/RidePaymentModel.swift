//
//  RidePaymentModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class RidePaymentModel: Model {
    public var ridePaymentToken: String = ""
    public var amount: CGFloat = 0
    public var tipAmount: CGFloat = 0
    public var paymentDesc: String = ""
    public var created_at: Date? = Date(timeIntervalSince1970: 1)
    public var updated_at: Date? = Date(timeIntervalSince1970: 1)

    public var ride: RideModel?
    public var transaction: TransactionModel?
    public var user: UserModel?

    public override func mapping(map: Map) {
        ridePaymentToken <- map["ridePaymentToken"]
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        paymentDesc <- map["paymentDesc"]
        created_at <- (map["created_at"], DateTransform())
        updated_at <- (map["updated_at"], DateTransform())
        ride <- map["ride"]
        transaction <- map["transaction"]
        user <- map["user"]
    }
}
