//
//  PlacesClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/13/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class PlacesClient: PickClient {

    /**
     * Get all places.
     *
     * Async GET /place
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func all(callback: ClientClosure<ResponseModelList<PlaceModel>>?) {
        return get(path: "place", args: [:], callback: callback)
    }

    /**
     * Get a place.
     *
     * Async GET /place/placeToken
     *
     * @param string placeToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func place(placeToken: String, callback: ClientClosure<ResponseModel<PlaceModel>>?) {
        return get(path: "place/" + placeToken, args: [:], callback: callback)
    }

    /**
     * Create new place.
     *
     * Async POST /place
     * {
     *   "placeType" : placeType,
     *   "name" : name,
     *   "address" : address,
     *   "latitude" : latitude,
     *   "longitude" : longitude
     * }
     *
     * @param string placeType
     * @param string name
     * @param string address
     * @param Double latitude
     * @param Double longitude
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func createPlace(placeType: String, name: String, address: String, latitude: Double, longitude: Double, callback: ClientClosure<ResponseModel<PlaceModel>>?) {
        let args: [String : Any] = [
            "placeType": placeType,
            "name": name,
            "address": address,
            "latitude": latitude,
            "longitude": longitude
        ]
        return post(path: "place", args: args, callback: callback)
    }

    /**
     * Update a place.
     *
     * Async PUT /place/placeToken
     * {
     *   "placeType" : placeType,
     *   "name" : name,
     *   "address" : address,
     *   "latitude" : latitude,
     *   "longitude" : longitude
     * }
     *
     * @param string placeToken
     * @param string placeType
     * @param string name
     * @param string address
     * @param Double latitude
     * @param Double longitude
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func updatePlace(placeToken: String, placeType: String, name: String, address: String, latitude: Double, longitude: Double, callback: ClientClosure<ResponseModel<PlaceModel>>?) {
        let args: [String : Any] = [
            "placeType": placeType,
            "name": name,
            "address": address,
            "latitude": latitude,
            "longitude": longitude
        ]
        return put(path: "place/" + placeToken, args: args, callback: callback)
    }

    /**
     * Delete a place.
     *
     * Async DELETE /place/placeToken
     *
     * @param string placeToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deletePlace(placeToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "place/" + placeToken, args: [:], callback: callback)
    }
}
