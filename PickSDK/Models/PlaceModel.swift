//
//  PlaceModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class PlaceModel: Model {
    public var placeToken: String = ""
    public var placeType: String = ""
    public var name: String = ""
    public var address: String = ""
    public var latitude: Double = 0.0
    public var longitude: Double = 0.0

    public override func mapping(map: Map) {
        placeToken <- map["placeToken"]
        placeType <- map["placeType"]
        name <- map["name"]
        address <- map["address"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}