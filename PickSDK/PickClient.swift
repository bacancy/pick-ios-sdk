//
//  PickClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 8/22/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

public typealias ClientClosure<T: Model> = (T?) -> Void

public class PickClient: NSObject {

    public static let unauthorizedNotificationID = "com.Pick.PickSDK.unauthorizedNotificationID"
    public static let accessTokenNotificationID = "com.Pick.PickSDK.accessTokenNotificationID"
    public static let currentUserNotificationID = "com.Pick.PickSDK.currentUserNotificationID"

#if DELIVERY
    public static let baseUrlProd: String = "https://api.joideliv.com/"
    public static let baseUrlQA: String = "https://api-qa.joideliv.com/"
    public static var baseUrl: String = "https://api.joideliv.com/"
#else
    public static let baseUrlProd: String = "https://api.joirides.com/"
    public static let baseUrlQA: String = "https://api-qa.joirides.com/"
    public static var baseUrl: String = "https://api.joirides.com/"
#endif

    public static var env: String = ""

    public static let noPassword = "x8egotETZVzl8n!2nUpTQDfOtdg$Br"

    public static var accessToken: String? {
        didSet {
            NotificationCenter.default.post(name: Notification.Name(rawValue: accessTokenNotificationID), object: self)
        }
    }

    public static var currentUser: UserModel? {
        didSet {
            NotificationCenter.default.post(name: Notification.Name(rawValue: currentUserNotificationID), object: self)
        }
    }

    public static var isLoggedIn: Bool {
        get {
            return accessToken != nil
        }
    }

    public func getHtml(path: String, args: [String: String] = [:], callback: ((String) -> Void)?) {
        let query = (args.map { element in String(element.key + "=" + element.value) }).joined(separator: "&")
        let path = path + (query.isEmpty ? "" : "?" + query)

        var headers: [String: String] = ["Content-Type": "text/html; charset=UTF-8"]
        if let accessToken = PickClient.accessToken {
            headers["Authorization"] = "Bearer " + accessToken
        }
        headers["X-TimeZone"] = TimeZone.current.identifier

        let URL = PickClient.baseUrl + path
        Alamofire.request(URL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseString { response in

            let result = response.result.value

            if let callback = callback {
                if let result = result {
                    callback(result)
                }
            }
        }
    }

    public func call<T: Model>(method: HTTPMethod, path: String, args: [String: Any] = [:], callback: ClientClosure<T>?) {
        var headers: [String: String] = ["Content-Type": "application/json"]

        var URL: String
        if path.hasPrefix("http") {
            URL = path
        } else {
            if let accessToken = PickClient.accessToken {
                headers["Authorization"] = "Bearer " + accessToken
            }
            headers["X-TimeZone"] = TimeZone.current.identifier

            URL = PickClient.baseUrl + path
        }
        Alamofire.request(URL, method: method, parameters: args.count == 0 ? nil : args, encoding: JSONEncoding.default, headers: headers).validate().responseObject { (response: DataResponse<T>) in

            let result = response.result.value

            if let loginModel = result as? LoginModel {
                if (!loginModel.access_token.isEmpty) {
                    PickClient.accessToken = loginModel.access_token
                }
            }

            if let apiModel = result as? ApiModel {
                if (apiModel.code == 401 && path != "user/logout") {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: PickClient.unauthorizedNotificationID), object: self)
                }
            }

            if let callback = callback {
                if let result = result {
                    callback(result)
                } else {
                    callback(nil)
                }
            }
        }
    }

    public func get<T: Model>(path: String, args: [String: String] = [:], callback: ClientClosure<T>?) {
        let query = (args.map { element in String(element.key + "=" + element.value) }).joined(separator: "&")
        let path = path + (query.isEmpty ? "" : "?" + query)
        return call(method: .get, path: path, args: [:], callback: callback)
    }

    public func post<T: Model>(path: String, args: [String: Any] = [:], callback: ClientClosure<T>?) {
        return call(method: .post, path: path, args: args, callback: callback)
    }

    public func put<T: Model>(path: String, args: [String: Any] = [:], callback: ClientClosure<T>?) {
        return call(method: .put, path: path, args: args, callback: callback)
    }

    public func delete<T: Model>(path: String, args: [String: String] = [:], callback: ClientClosure<T>?) {
        return call(method: .delete, path: path, args: args, callback: callback)
    }

    public func transformAPIDateString(_ value: Any?) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let strValue = value as? String else { return nil }
        return formatter.date(from: strValue)
    }
}
