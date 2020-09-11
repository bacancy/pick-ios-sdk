//
//  ApiModel.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 8/27/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

protocol ApiModel {
    var code: Int { get }
    var message: String { get }
    var errors: [String: [String]] { get }
    var success: Bool { get }
}
