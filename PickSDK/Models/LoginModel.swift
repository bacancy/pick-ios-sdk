//
//  LoginModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 8/22/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import ObjectMapper

public class LoginModel: ResponseModel<Model> {
    public var token_type: String = ""
    public var expires_in: Int = 0
    public var access_token: String = ""
    public var refresh_token: String = ""

    public override func mapping(map: Map) {
        super.mapping(map: map)

        token_type <- map["token_type"]
        expires_in <- map["expires_in"]
        access_token <- map["access_token"]
        refresh_token <- map["refresh_token"]
    }
}
