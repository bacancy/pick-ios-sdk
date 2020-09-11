//
//  DeliveryClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 11/14/19.
//  Copyright © 2019 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class DeliveryClient: PickClient {

    /**
     * Update the delivery driver location.
     *
     * Async PUT /delivery/location/{rideToken}
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
        return put(path: "delivery/location/\(rideToken)", args: args, callback: callback)
    }

    /**
     * Update current delivery driver's profile photo.
     *
     * Async POST /delivery/photo
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
        return put(path: "delivery/photo", args: args, callback: callback)
    }

    /**
     * Update current delivery driver's area.
     *
     * Async PUT /delivery/area
     * {
     *   "delivAreaId": 2
     * }
     *
     * @param int delivAreaId
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deliveryArea(delivAreaId: Int, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String : Any] = [
            "delivAreaId": delivAreaId
        ]
        return put(path: "delivery/area", args: args, callback: callback)
    }

    /**
     * Submit delivery driver for acceptance.
     *
     * Async POST /delivery/submit
     * {
     *   "delivAgreement": true,
     *   "delivAgreementDate": "5/3/2018"
     * }
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func submit(delivAgreement: Bool, delivAgreementDate: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String: Any] = [
            "delivAgreement": delivAgreement,
            "delivAgreementDate": delivAgreementDate
        ];
        return post(path: "delivery/submit", args: args, callback: callback)
    }
}
