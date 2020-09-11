//
//  RideResultsModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 09/23/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class RideResultsModel: Model {
    public var ride: RideModel?
    public var rideData: RideDataModel?

    public override func mapping(map: Map) {
        ride <- map["ride"]
        rideData <- map["rideData"]
    }
}