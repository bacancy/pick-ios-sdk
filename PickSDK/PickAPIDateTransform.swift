//
//  PickAPIDateTransform.swift
//  PickSDK
//
//  Created by Erik Rodriguez on 5/5/19.
//  Copyright © 2019 Pick Ride Network, Inc. All rights reserved.
//

import Foundation
import ObjectMapper

open class PickAPIDateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String

    public init() {}

    open func transformFromJSON(_ value: Any?) -> Date? {
        if let timeInt = value as? Double {
            return Date(timeIntervalSince1970: TimeInterval(timeInt))
        }

        if let timeStr = value as? String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter.date(from: timeStr)
        }

        return nil
    }

    open func transformToJSON(_ value: Date?) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = value {
            return formatter.string(from: date)
        }
        return nil
    }
}
