//
//  RideClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/19/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class RideClient: PickClient {

    /**
     * Get route pricing.
     *
     * Async POST /ride/price
     *
     * @param Double distance
     * @param Int expectedTravelTime
     * @param PlaceModel pickupPlace
     * @param PlaceModel destination1
     * @param PlaceModel destination2
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func price(distance: Double, expectedTravelTime: Int, pickupPlace: PlaceModel, destination1: PlaceModel, destination2: PlaceModel?, callback: ClientClosure<ResponseModelList<PriceModel>>?) {
        let args: [String: Any] = [
            "distance": distance,
            "expectedTravelTime": expectedTravelTime,
            "pickupPlace": pickupPlace.toJSON(),
            "destination1": destination1.toJSON(),
            "destination2": destination2 != nil ? destination2!.toJSON() : NSNull()
        ]
        return post(path: "ride/price", args: args, callback: callback)
    }

    /**
     * Create new ride request.
     *
     * Async POST /ride
     * {
     *   "rideType": "standard",
     *   "startAmount": 24.95,
     *   "priceToken": "d008071549ca69e3500fe1f8832bf245"
     *   "pickupPlace": {
     *     "latitude": 33.127839000000002,
     *     "name": "5936 Nancy Jane Lane",
     *     "placeToken": "",
     *     "longitude": -96.801300999999995,
     *     "placeType": "address",
     *     "address": "5936 Nancy Jane Lane, Frisco, Texas 75035, United States"
     *   },
     *   "destination1": {
     *     "latitude": 33.108218300000004,
     *     "name": "Starbucks",
     *     "placeToken": "",
     *     "longitude": -96.806710199999998,
     *     "placeType": "business",
     *     "address": "3511 Preston Rd #2, Frisco, TX 75034, USA"
     *   },
     *   "destination2": PlaceModel
     *   "routeData": [String: Any]
     * }
     *
     * @param string placeType
     * @param Double startAmount
     * @param string priceToken
     * @param PlaceModel pickupPlace
     * @param PlaceModel destination1
     * @param PlaceModel destination2
     * @param [String: Any] routeData
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func create(rideType: String, startAmount: Double, prices: [PriceModel], priceToken: String, pickupPlace: PlaceModel, destination1: PlaceModel, destination2: PlaceModel?, routeData: [String: Any], callback: ClientClosure<ResponseModel<RideModel>>?) {
        let args: [String: Any] = [
            "rideType": rideType,
            "startAmount": startAmount,
            "prices": prices.toJSON(),
            "priceToken": priceToken,
            "pickupPlace": pickupPlace.toJSON(),
            "destination1": destination1.toJSON(),
            "destination2": destination2 != nil ? destination2!.toJSON() : NSNull(),
            "routeData": routeData
        ]
        return post(path: "ride", args: args, callback: callback)
    }

    /**
     * Ride request payment.
     *
     * Async POST /ride/payment
     * {
     *   "rideToken": "8c7408742929551baeafa42c1fe47e4a",
     *   "rate": 3,
     *   "comment": "Thanks for the ride!",
     *   "tipAmount": 1.5,
     *   "paymentNonce": "asdfadsfadsfadsfadsfasdfadsf",
     *   "paymentDesc": "Visa ending 44"
     * }
     *
     * @param String rideToken
     * @param Int rate
     * @param String comment
     * @param Double tipAmount
     * @param String paymentNonce
     * @param String paymentDesc
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func payment(rideToken: String, rate: Int, comment: String, tipAmount: Double, paymentNonce: String, paymentDesc: String, callback: ClientClosure<ResponseModel<Model>>?) {
        let args: [String: Any] = [
            "rideToken": rideToken,
            "rate": rate,
            "comment": comment,
            "tipAmount": tipAmount,
            "paymentNonce": paymentNonce,
            "paymentDesc": paymentDesc
        ]
        return post(path: "ride/payment", args: args, callback: callback)
    }

    /**
     * Get current ride request.
     *
     * Async GET /ride
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func currentRide(callback: ClientClosure<ResponseModel<RideResultsModel>>?) {
        return get(path: "ride", args: [:], callback: callback)
    }

    /**
     * Cancel ride request.
     *
     * Async DELETE /ride/{token}
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func cancelRide(rideToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "ride/\(rideToken)", args: [:], callback: callback)
    }

    /**
     * Ride was picked up.
     *
     * Async PUT /ride/{token}
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func pickedUp(rideToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return put(path: "ride/\(rideToken)", args: [:], callback: callback)
    }

    /**
     * Get current user's ride history.
     *
     * Async GET /ride/history/all
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func history(callback: ClientClosure<ResponseModelList<HistoryModel>>?) {
        return get(path: "ride/history/all", args: [:], callback: callback)
    }

    /**
     * Get current user's scheduled rides.
     *
     * Async GET /ride/history/scheduled
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func scheduled(callback: ClientClosure<ResponseModelList<HistoryModel>>?) {
        return get(path: "ride/history/scheduled", args: [:], callback: callback)
    }

    /**
     * Get current user's single ride history.
     *
     * Async GET /ride/history/{rideToken}/details
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func historyDetails(rideToken: String, callback: ClientClosure<ResponseModel<HistoryModel>>?) {
        return get(path: "ride/history/\(rideToken)/details", args: [:], callback: callback)
    }

    /**
     * Send ride receipt to email.
     *
     * Async GET /ride/history/{rideToken}/receipt
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func receipt(rideToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return get(path: "ride/history/\(rideToken)/receipt", args: [:], callback: callback)
    }

    /**
     * Get ride receipt as html.
     *
     * Async GET /ride/history/{rideToken}/receipt/view
     *
     * @param string rideToken
     * @param callback: ((String) -> Void)
     * @return String
     */
    public func viewReceipt(rideToken: String, callback: ((String) -> Void)?) {
        return getHtml(path: "ride/history/\(rideToken)/receipt/view", callback: callback)
    }

    /**
     * Update the rider location.
     *
     * Async PUT /ride/location/{rideToken}
     * {
     *   "latitude": 30,
     *   "longitude": -110,
     *   "speed": 35,
     *   "course": 90
     * }
     *
     * @param string rideToken
     * @param double latitude
     * @param double longitude
     * @param int speed
     * @param int course
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func updateLocation(rideToken: String, latitude: Double, longitude: Double, speed: Int, course: Int, callback: ClientClosure<ResponseModel<Model>>?) {
        let args: [String : Any] = [
            "latitude": latitude,
            "longitude": longitude,
            "speed": speed,
            "course": course
        ]
        return put(path: "ride/location/\(rideToken)", args: args, callback: callback)
    }

    /**
     * Get ride request bids.
     *
     * Async GET /ride/{rideToken}/bid
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func rideBids(rideToken: String, callback: ClientClosure<ResponseModelList<BidModel>>?) {
        return get(path: "ride/\(rideToken)/bid", args: [:], callback: callback)
    }

    /**
     * Get ride accepted bid.
     *
     * Async GET /ride/{rideToken}/bid/accepted
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func acceptedBid(rideToken: String, callback: ClientClosure<ResponseModel<BidModel>>?) {
        return get(path: "ride/\(rideToken)/bid/accepted", args: [:], callback: callback)
    }

    /**
     * Accept bid for ride request.
     *
     * Async PUT /ride/{rideToken}/bid/{userToken}
     *
     * @param string rideToken
     * @param string userToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func acceptBid(rideToken: String, userToken: String, callback: ClientClosure<ResponseModel<RideModel>>?) {
        return put(path: "ride/\(rideToken)/bid/\(userToken)", args: [:], callback: callback)
    }

    /**
     * Place bid on ride request.
     *
     * Async POST /ride/{rideToken}/bid
     * {
     *   "autoToken": "89beacf672c0549bbbaa8badfb588da2",
     *   "latitude": 30,
     *   "longitude": -110,
     *   "eta": 6
     * }
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func bid(rideToken: String, autoToken: String, latitude: Double, longitude: Double, eta: Int, callback: ClientClosure<ResponseModel<BidModel>>?) {
        let args: [String : Any] = [
            "autoToken": autoToken,
            "latitude": latitude,
            "longitude": longitude,
            "eta": eta
        ]
        return post(path: "ride/\(rideToken)/bid", args: args, callback: callback)
    }

    /**
     * Retract a bid, only can be bidder.
     *
     * Async GET /ride/{rideToken}/bid
     *
     * @param string rideToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func retract(rideToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "ride/\(rideToken)/bid", args: [:], callback: callback)
    }
}
