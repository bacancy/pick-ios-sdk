//
//  BraintreeClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/15/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class BraintreeClient: PickClient {

    /**
     * Get braintree client token.
     *
     * Async GET /braintree/token
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func token(callback: ClientClosure<ResponseModel<TokenModel>>?) {
        return get(path: "braintree/token", args: [:], callback: callback)
    }

    /**
     * Get braintree client payments.
     *
     * Async GET /braintree/payments
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func payments(callback: ClientClosure<ResponseModelList<PaymentModel>>?) {
        return get(path: "braintree/payments", args: [:], callback: callback)
    }

    /**
     * Delete braintree client payment method.
     *
     * Async GET /braintree/{token}
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deletePayment(token: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "braintree/" + token, args: [:], callback: callback)
    }

    /**
     * Set braintree client payment method as default.
     *
     * Async GET /braintree/{token}
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func defaultPayment(token: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return put(path: "braintree/" + token, args: [:], callback: callback)
    }
}
