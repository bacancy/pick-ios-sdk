//
//  AddressClient.swift
//  PickSDK
//
//  Created by Erik Rodriguez on 2/10/20.
//

import Foundation

public class AddressClient: PickClient {

    /**
     * Create a new address.
     *
     * Async POST /user/address
     * {
     *   "name": name,
     *   "street": street,
     *   "street2": street2,
     *   "city": city,
     *   "state": state,
     *   "postalCode": postalCode
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
    public func postAddress(name: String, street: String, street2: String, city: String, state: String, postalCode: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "name": name,
            "street": street,
            "street2": street2,
            "city": city,
            "state": state,
            "postalCode": postalCode
        ]
        return post(path: "address", args: args, callback: callback)
    }
    
    /**
     * Update an address.
     *
     * Async PUT /user/address/{addressToken}
     * {
     *   "name": name,
     *   "street": street,
     *   "street2": street2,
     *   "city": city,
     *   "state": state,
     *   "postalCode": postalCode
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
    public func putAddress(addressToken: String, name: String, street: String, street2: String, city: String, state: String, postalCode: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "name": name,
            "street": street,
            "street2": street2,
            "city": city,
            "state": state,
            "postalCode": postalCode
        ]
        return put(path: "address/" + addressToken, args: args, callback: callback)
    }
}
