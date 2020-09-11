//
//  DriverClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/15/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class DriverClient: PickClient {

    /**
     * Get current user's favorites.
     *
     * Async GET /driver/favorites
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func favorites(callback: ClientClosure<ResponseModelList<UserModel>>?) {
        return get(path: "driver/favorites", args: [:], callback: callback)
    }

    /**
     * Save user to favorites.
     *
     * Async POST /driver/favorites/{token}
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func addFavorite(token: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return post(path: "driver/favorites/" + token, args: [:], callback: callback)
    }

    /**
     * Remove user from favorites.
     *
     * Async DELETE /driver/favorites/{token}
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deleteFavorite(token: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "driver/favorites/" + token, args: [:], callback: callback)
    }

    /**
     * Update the driver location.
     *
     * Async PUT /driver/location/{rideToken}
     * {
     *   "status": "booked",
     *   "autoToken": "89beacf672c0549bbbaa8badfb588da2",
     *   "latitude": 30,
     *   "longitude": -110,
     *   "speed": 35,
     *   "course": 90
     * }
     *
     * @param string rideToken
     * @param string status
     * @param string autoToken
     * @param double latitude
     * @param double longitude
     * @param int speed
     * @param int course
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func updateLocation(rideToken: String, status: String, autoToken: String, latitude: Double, longitude: Double, speed: Int, course: Int, callback: ClientClosure<ResponseModel<Model>>?) {
        let args: [String : Any] = [
            "status": status,
            "autoToken": autoToken,
            "latitude": latitude,
            "longitude": longitude,
            "speed": speed,
            "course": course
        ]
        return put(path: "driver/location/\(rideToken)", args: args, callback: callback)
    }

    /**
     * Update current driver's profile photo.
     *
     * Async POST /driver/photo
     * {
     *   "image" : image
     * }
     *
     * @param UIImage image
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func photo(image: UIImage, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var imageBase64 = ""

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            imageBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        let args = [
            "image": imageBase64
        ];
        return put(path: "driver/photo", args: args, callback: callback)
    }

    /**
     * Update current driver's area and team id.
     *
     * Async PUT /driver/area
     * {
     *   "driverAreaId": 2,
     *   "teamId": "apex"
     * }
     *
     * @param int driverAreaId
     * @param string teamId
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func driverAreaTeam(driverAreaId: Int, teamId: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String : Any] = [
            "driverAreaId": driverAreaId,
            "teamId": teamId
        ]
        return put(path: "driver/area", args: args, callback: callback)
    }

    /**
     * Update current driver's license details.
     *
     * Async PUT /driver/license
     * {
     *   "firstName": "Tom",
     *   "lastName": "White",
     *   "licenseNum": "1123456789",
     *   "licenseState": "TX",
     *   "dob": "4/27/1997",
     *   "licenseExp": "4/28/2019",
     *   "license1yr": true
     * }
     *
     * @param string location ('front' or 'back')
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func license(firstName: String, lastName: String, licenseNum: String, licenseState: String, dob: String, licenseExp: String, license1yr: Bool, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "licenseNum": licenseNum,
            "licenseState": licenseState,
            "dob": dob,
            "licenseExp": licenseExp,
            "license1yr": license1yr
        ];
        return put(path: "driver/license", args: args, callback: callback)
    }

    /**
     * Update current driver's license photos.
     *
     * Async PUT /driver/license/{location}
     * {
     *   "image" : image
     * }
     *
     * @param string location ('front' or 'back')
     * @param UIImage image
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func license(location: String, image: UIImage, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var imageBase64 = ""

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            imageBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        let args = [
            "image": imageBase64
        ];
        return put(path: "driver/license/\(location)", args: args, callback: callback)
    }

    /**
     * Submit driver for acceptance.
     *
     * Async POST /driver/submit
     * {
     *   "driverAgreement": true,
     *   "driverAgreementDate": "5/3/2018",
     *   "last4": "0000",
     *   "ipAddress": "192.168.0.0"
     * }
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func submit(driverAgreement: Bool, driverAgreementDate: String, last4: String, ipAddress: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String: Any] = [
            "driverAgreement": driverAgreement,
            "driverAgreementDate": driverAgreementDate,
            "last4": last4,
            "ipAddress": ipAddress
        ];
        return post(path: "driver/submit", args: args, callback: callback)
    }
    
    /**
     * Resubmit driver for acceptance.
     *
     * Async POST /driver/resubmit
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func resubmit(callback: ClientClosure<ResponseModel<UserModel>>?) {
        return post(path: "driver/resubmit", args: [:], callback: callback)
    }

    // MARK: - v2

    /**
     * Update current driver's area.
     *
     * Async PUT /driver/area/v2
     * {
     *   "driverAreaId": 2
     * }
     *
     * @param int driverAreaId
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func driverArea(driverAreaId: Int, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String : Any] = [
            "driverAreaId": driverAreaId
        ]
        return put(path: "driver/area/v2", args: args, callback: callback)
    }
    
    /**
     * Sync driver to camelot.
     *
     * Async PUT /driver/camelot
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func camelot(callback: ClientClosure<ResponseModel<UserModel>>?) {
        return put(path: "driver/camelot", args: [:], callback: callback)
    }
}
