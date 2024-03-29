//
//  AutoModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class AutoModel: Model {
    public var autoToken: String = ""
    public var rideType: String = ""
    public var comments: String = ""
    public var year: Int = 0
    public var make: String = ""
    public var model: String = ""
    public var plate: String = ""
    public var state: String = ""
    public var color: String = ""
    public var black: Bool = false
    public var seatbelts: Int = 0
    public var doors: Int = 0
    public var amenities: String = ""
    public var insProvider: String = ""
    public var insPolicyNum: String = ""
    public var photo_url: String = ""
    public var insuranceExp: Date? = Date(timeIntervalSince1970: 1)
    public var registrationExp: Date? = Date(timeIntervalSince1970: 1)
    public var needs_photos: Bool = false
    public var needs_insurance: Bool = false
    public var needs_registration: Bool = false
    public var photo_front_url: String = ""
    public var photo_rear_url: String = ""
    public var photo_side_url: String = ""
    public var photo_pass_side_url: String = ""
    public var photo_int_front_url: String = ""
    public var photo_interior_url: String = ""
    public var insurance_url: String = ""
    public var registration_url: String = ""
    public var rejectedReason: String = ""
    public var auto_status: String = ""
    public var registration_exp_at: Date = Date(timeIntervalSince1970: 1)
    public var insurance_exp_at: Date = Date(timeIntervalSince1970: 1)

    public var user: UserModel?
    public var bids: [BidModel]?
    public var rides: [RideModel]?

    public override func mapping(map: Map) {
        autoToken <- map["autoToken"]
        rideType <- map["rideType"]
        comments <- map["comments"]
        year <- map["year"]
        make <- map["make"]
        model <- map["model"]
        plate <- map["plate"]
        state <- map["state"]
        color <- map["color"]
        black <- map["black"]
        seatbelts <- map["seatbelts"]
        doors <- map["doors"]
        amenities <- map["amenities"]
        photo_url <- map["photo_url"]
        insProvider <- map["insProvider"]
        insPolicyNum <- map["insPolicyNum"]
        insuranceExp <- (map["insuranceExp"], PickAPIDateTransform())
        registrationExp <- map["registrationExp"]
        needs_photos <- map["needs_photos"]
        needs_insurance <- map["needs_insurance"]
        needs_registration <- map["needs_registration"]
        photo_front_url <- map["photo_front_url"]
        photo_rear_url <- map["photo_rear_url"]
        photo_side_url <- map["photo_side_url"]
        photo_pass_side_url <- map["photo_pass_side_url"]
        photo_int_front_url <- map["photo_int_front_url"]
        photo_interior_url <- map["photo_interior_url"]
        insurance_url <- map["insurance_url"]
        registration_url <- map["registration_url"]
        rejectedReason <- map["rejectedReason"]
        auto_status <- map["auto_status"]
        registration_exp_at <- (map["registration_exp_at"], DateTransform())
        insurance_exp_at <- (map["insurance_exp_at"], DateTransform())
        user <- map["user"]
        bids <- map["bids"]
        rides <- map["rides"]
    }
}
