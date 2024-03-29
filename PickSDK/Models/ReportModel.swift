//
//  ReportModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class ReportModel: Model {
    public var reportId: Int = 0
    public var byUserId: Int = 0
    public var userId: Int = 0
    public var section: String = ""
    public var reason: String = ""
    public var createDate: Date? = Date(timeIntervalSince1970: 1)

    public var user: UserModel?

    public override func mapping(map: Map) {
        reportId <- map["reportId"]
        byUserId <- map["byUserId"]
        userId <- map["userId"]
        section <- map["section"]
        reason <- map["reason"]
        createDate <- map["createDate"]
        user <- map["user"]
    }
}
