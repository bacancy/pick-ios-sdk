//
//  MessageClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/2/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class MessageClient: PickClient {

    /**
     * Get all messages.
     *
     * Async GET /message
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func messages(callback: ClientClosure<ResponseModelList<ThreadUserModel>>?) {
        return get(path: "message", args: [:], callback: callback)
    }

    /**
     * Get all messages for user.
     *
     * Async GET /message/user/{userToken}
     *
     * @param string userToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func userMessages(userToken: String, callback: ClientClosure<ResponseModel<ThreadUserModel>>?) {
        return get(path: "message/user/" + userToken, args: [:], callback: callback)
    }

    /**
     * Send message.
     *
     * Async POST /message
     * {
     *   "userToken" : userToken,
     *   "message" : message
     * }
     *
     * @param string userToken
     * @param string message
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func send(userToken: String, message: String, callback: ClientClosure<ResponseModel<MessageModel>>?) {
        let args = [
            "userToken": userToken,
            "message": message
        ]

        return post(path: "message", args: args, callback: callback)
    }

    /**
     * Send message to support.
     *
     * Async POST /message/support
     * {
     *   "message" : message
     * }
     *
     * @param string message
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func support(message: String, callback: ClientClosure<ResponseModel<MessageModel>>?) {
        let args = [
            "message": message
        ]

        return post(path: "message/support", args: args, callback: callback)
    }

    /**
     * Mark message read.
     *
     * Async PUT /message/messageToken
     *
     * @param string messageToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func read(messageToken: String, callback: ClientClosure<ResponseModel<MessageModel>>?) {
        return put(path: "message/" + messageToken, args: [:], callback: callback)
    }

    /**
     * Delete message.
     *
     * Async DELETE /message/messageToken
     *
     * @param string messageToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deleteMessage(messageToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "message/" + messageToken, args: [:], callback: callback)
    }
}
