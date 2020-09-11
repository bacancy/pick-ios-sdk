//
//  ThreadUserModel.swift
//  PickSDK
//
//  This code was generated by MakeSwift.php on 07/30/18, DO NOT EDIT.
//  Changes to this file will be lost if the code is regenerated.
//
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class ThreadUserModel: Model {
    public var token: String = ""
    public var to_user: UserModel?
    public var messages: [MessageModel]?

    public override func mapping(map: Map) {
        token <- map["token"]
        to_user <- map["to_user"]
        messages <- map["messages"]
    }
}