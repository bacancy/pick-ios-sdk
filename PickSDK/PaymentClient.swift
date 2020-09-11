//
//  PaymentClient.swift
//  PickSDK
//
//  Created by Howard Cantrell on 2/13/20.
//  Copyright © 2020 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class PaymentClient: PickClient {
    
    /**
     * Create new driver onboarding payment.
     *
     * Async POST /payment/driver
     * {
     *   "firstName": "Bob",
     *   "lastName": "Johnson",
     *   "street": street,
     *   "city": city,
     *   "state": state,
     *   "postalCode": postalCode,
     *   "exp": "1/2021",
     *   "cvv": "123",
     *   "token": "411111S42UC01111",
     *   "tokenHMAC": "SeSweVRZk98aA+J6zHqfpT1rOsSniAMEpF+bMG4WwIw="
     * }
     *
     * @param string firstName
     * @param string lastName
     * @param string street
     * @param string city
     * @param string state
     * @param string postalCode
     * @param string exp
     * @param string cvv
     * @param string token
     * @param string tokenHMAC
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func paymentDriver(firstName: String, lastName: String, street: String, city: String, state: String, postalCode: String, exp: String, cvv: String, token: String, tokenHMAC: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "firstName": firstName,
            "lastName": lastName,
            "street": street,
            "city": city,
            "state": state,
            "postalCode": postalCode,
            "exp": exp,
            "cvv": cvv,
            "token": token,
            "tokenHMAC": tokenHMAC
        ]
        return post(path: "payment/driver", args: args, callback: callback)
    }
    
    /**
     * Generate tokenex json request.
     *
     * Async GET /tokenex
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func tokenex(callback: ClientClosure<ResponseModel<TokenexModel>>?) {
        return get(path: "tokenex", args: [:], callback: callback)
    }

    public static let tokenizeUrlQA: String = "https://test-htp.tokenex.com/api/sdk/Tokenize"
    public static let tokenizeUrlProd: String = "https://us1-htp.tokenex.com/api/sdk/Tokenize"
    
    public static var tokenizeUrl: String = "https://us1-htp.tokenex.com/api/sdk/Tokenize"

    /**
     * Tokenize the credit card number.
     *
     * Async POST https://test-htp.tokenex.com/api/sdk/Tokenize
     * {
     *   "tokenexid": "5738829947179544",
     *   "timestamp": "20200213051903",
     *   "authenticationKey": "P1oRsacSihduXQ4ZK+a8ax6MYbygHNHVw71iEkTj378=",
     *   "data": "4111111111111111",
     *   "tokenScheme": "sixTOKENfour"
     * }
     *
     * @param string name
     * @param string street
     * @param string street2
     * @param string city
     * @param string state
     * @param string postalCode
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func tokenize(tokenex: TokenexModel, callback: ClientClosure<TokenizeModel>?) {
        let args = tokenex.toJSON()
        return post(path: PaymentClient.tokenizeUrl, args: args, callback: callback)
    }
}
