//
//  LicenseClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 11/14/19.
//  Copyright © 2019 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class LicenseClient: PickClient {

    /**
     * Update current driver's license details.
     *
     * Async PUT /license
     * {
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
    public func license(firstName: String, middleName: String, lastName: String, licenseNum: String, licenseState: String, dob: String, licenseExp: String, license1yr: Bool, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var args: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "licenseNum": licenseNum,
            "licenseState": licenseState,
            "dob": dob,
            "licenseExp": licenseExp,
            "license1yr": license1yr
        ];

        if !middleName.isEmpty {
            args["middleName"] = middleName
        }

        return put(path: "license", args: args, callback: callback)
    }

    /**
     * Update current driver's license photos.
     *
     * Async PUT /license/{location}
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
        return put(path: "license/\(location)", args: args, callback: callback)
    }
}
