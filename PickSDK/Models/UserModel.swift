//
//  UserModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class UserModel: Model {
    public var userToken: String = ""
    public var email: String = ""
    public var titleName: String = ""
    public var firstName: String = ""
    public var middleName: String = ""
    public var lastName: String = ""
    public var country: String = ""
    public var company: String = ""
    public var tshirt: String = ""
    public var hometown: String = ""
    public var music: String = ""
    public var about: String = ""
    public var notifAccount: Bool = false
    public var notifNews: Bool? = false
    public var approved: Bool = false
    public var termsAgreement: Bool = false
    public var refCode: String = ""
    public var refByCode: String = ""
    public var phone: String = ""
    public var exists: Bool = false
    public var active_at: Date = Date(timeIntervalSince1970: 1)
    public var created_at: Date = Date(timeIntervalSince1970: 1)
    public var rate: CGFloat = 0
    public var approved_ago: String = ""
    public var photo_url: String = ""
    public var has_email: Bool = false
    public var has_password: Bool = false
    public var has_dob: Bool = false
    public var has_ssn: Bool = false
    public var has_tin: Bool = false
    public var stage: StageModel?
    public var addresses: [AddressModel]?
    public var autos: [AutoModel]?
    public var bids: [BidModel]?
    public var license: LicenseModel?
    public var driver: DriverModel?
    public var delivery: DeliveryModel?
    public var driver_locations: [DriverLocationModel]?
    public var favorites: [FavoriteModel]?
    public var friends: [FriendModel]?
    public var invites: [InviteModel]?
    public var login_histories: [LoginHistoryModel]?
    public var threads: [ThreadUserModel]?
    public var network: NetworkModel?
    public var networks: [NetworkModel]?
    public var notifications: [NotificationModel]?
    public var places: [PlaceModel]?
    public var reports: [ReportModel]?
    public var requests: [RequestModel]?
    public var ride_locations: [RideLocationModel]?
    public var ride_payments: [RidePaymentModel]?
    public var rides: [RideModel]?
    public var drives: [RideModel]?
    public var deliveries: [RideModel]?
    public var user_ratings: [UserRatingModel]?
    public var driver_ratings: [UserRatingModel]?
    public var deliv_ratings: [UserRatingModel]?

    public override func mapping(map: Map) {
        userToken <- map["userToken"]
        email <- map["email"]
        titleName <- map["titleName"]
        firstName <- map["firstName"]
        middleName <- map["middleName"]
        lastName <- map["lastName"]
        country <- map["country"]
        company <- map["company"]
        tshirt <- map["tshirt"]
        hometown <- map["hometown"]
        music <- map["music"]
        about <- map["about"]
        notifAccount <- map["notifAccount"]
        notifNews <- map["notifNews"]
        rate <- map["rate"]
        approved <- map["approved"]
        approved_ago <- map["approved_ago"]
        photo_url <- map["photo_url"]
        has_email <- map["has_email"]
        has_password <- map["has_password"]
        has_dob <- map["has_dob"]
        has_ssn <- map["has_ssn"]
        has_tin <- map["has_tin"]
        termsAgreement <- map["termsAgreement"]
        active_at <- (map["active_at"], DateTransform())
        created_at <- (map["created_at"], DateTransform())
        refCode <- map["refCode"]
        refByCode <- map["refByCode"]
        phone <- map["phone"]
        exists <- map["exists"]
        stage <- map["stage"]
        addresses <- map["addresses"]
        autos <- map["autos"]
        bids <- map["bids"]
        license <- map["license"]
        driver <- map["driver"]
        delivery <- map["delivery"]
        driver_locations <- map["driver_locations"]
        favorites <- map["favorites"]
        friends <- map["friends"]
        invites <- map["invites"]
        login_histories <- map["login_histories"]
        threads <- map["threads"]
        network <- map["network"]
        networks <- map["networks"]
        notifications <- map["notifications"]
        places <- map["places"]
        reports <- map["reports"]
        requests <- map["requests"]
        ride_locations <- map["ride_locations"]
        ride_payments <- map["ride_payments"]
        rides <- map["rides"]
        drives <- map["drives"]
        deliveries <- map["deliveries"]
        user_ratings <- map["user_ratings"]
        driver_ratings <- map["driver_ratings"]
        deliv_ratings <- map["deliv_ratings"]
    }
}
