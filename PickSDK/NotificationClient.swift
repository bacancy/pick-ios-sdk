//
//  NotificationClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 9/2/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class NotificationClient: PickClient {

    /**
     * Get notifications.
     *
     * Async GET /notification
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func notifications(callback: ClientClosure<ResponseModelList<NotificationModel>>?) {
        return get(path: "notification", args: [:], callback: callback);
    }

    /**
     * Mark notification read.
     *
     * Async PUT /notification/notificationToken
     *
     * @param string notificationToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func readNotification(notificationToken: String, callback: ClientClosure<ResponseModel<NotificationModel>>?) {
        return put(path: "notification/" + notificationToken, args: [:], callback: callback);
    }

    /**
     * Delete notification.
     *
     * Async DELETE /notification/notificationToken
     *
     * @param string notificationToken
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deleteNotification(notificationToken: String, callback: ClientClosure<ResponseModel<Model>>?) {
        return delete(path: "notification/" + notificationToken, args: [:], callback: callback);
    }
}
