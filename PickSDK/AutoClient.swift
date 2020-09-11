//
//  AutoClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 4/28/19.
//  Copyright © 2019 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class AutoClient: PickClient {

    /**
     * Create a new driver auto.
     *
     * Async POST /auto
     * {
     *   "rideType": "black",
     *   "year": 2011,
     *   "make": "Lexus",
     *   "model": "IS 300",
     *   "plate": "FES4GTT",
     *   "color": "Black",
     *   "seatbelts": 5,
     *   "doors": 4
     * }
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func createAuto(rideType: String, year: Int, make: String, model: String, plate: String, color: String, state: String, seatbelts: Int, doors: Int, callback: ClientClosure<ResponseModel<AutoModel>>?) {
        let args: [String: Any] = [
            "rideType": rideType,
            "year": year,
            "make": make,
            "model": model,
            "plate": plate,
            "state": state,
            "color": color,
            "seatbelts": seatbelts,
            "doors": doors
        ];
        return post(path: "auto", args: args, callback: callback)
    }

    /**
     * Create a new driver auto.
     *
     * Async POST /auto
     * {
     *   "rideType": "black",
     *   "year": 2011,
     *   "make": "Lexus",
     *   "model": "IS 300",
     *   "plate": "FES4GTT",
     *   "color": "Black",
     *   "seatbelts": 5,
     *   "doors": 4
     * }
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func updateAuto(autoToken: String, rideType: String, year: Int, make: String, model: String, plate: String, color: String, state: String, seatbelts: Int, doors: Int, callback: ClientClosure<ResponseModel<AutoModel>>?) {
        let args: [String: Any] = [
            "rideType": rideType,
            "year": year,
            "make": make,
            "model": model,
            "plate": plate,
            "state": state,
            "color": color,
            "seatbelts": seatbelts,
            "doors": doors
        ];
        return put(path: "auto/\(autoToken)", args: args, callback: callback)
    }

    /**
     * Add auto details.
     *
     * Async PUT /auto/{autoToken}/details
     * {
     *   "comments": "I am a comment",
     *   "amenities": WiFi, Free waters, snacks, cookies!,
     * }
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func autoDetails(autoToken: String, comments: String, amenities: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args: [String: Any] = [
            "comments": comments,
            "amenities": amenities
        ];
        return put(path: "auto/\(autoToken)/details", args: args, callback: callback)
    }

    /**
     * Update auto's photos.
     *
     * Async PUT /auto/{autoToken}/{location}
     * {
     *   "image" : image
     * }
     *
     * @param string autoToken
     * @param string location ('front', 'rear', 'side', 'interior')
     * @param UIImage image
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func autoPhoto(autoToken: String, location: String, image: UIImage, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var imageBase64 = ""

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            imageBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        let args = [
            "image": imageBase64
        ];
        return put(path: "auto/\(autoToken)/photo/\(location)", args: args, callback: callback)
    }

    /**
     * Update auto's registration.
     *
     * Async PUT /auto/{autoToken}/registration
     * {
     *   "image" : image
     * }
     *
     * @param string autoToken
     * @param string expiration
     * @param UIImage image
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func autoRegistration(autoToken: String, expiration: String, image: UIImage, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var imageBase64 = ""

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            imageBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        let args = [
            "image": imageBase64,
            "expiration": expiration
        ];
        return put(path: "auto/\(autoToken)/registration", args: args, callback: callback)
    }

    /**
     * Update auto's insurance.
     *
     * Async PUT /auto/{autoToken}/insurance
     * {
     *   "image" : image
     * }
     *
     * @param string autoToken
     * @param string provider
     * @param string policyNum
     * @param string expiration
     * @param UIImage image
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func autoInsurance(autoToken: String, provider: String, policyNum: String, expiration: String, image: UIImage, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var imageBase64 = ""

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            imageBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        let args = [
            "image": imageBase64,
            "provider": provider,
            "policyNum": policyNum,
            "expiration": expiration
        ];
        return put(path: "auto/\(autoToken)/insurance", args: args, callback: callback)
    }
}
