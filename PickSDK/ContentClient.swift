//
//  ContentClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 8/28/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class ContentClient: PickClient {

    /**
     * Get app settings.
     *
     * Async GET /app/settings/name/version
     *
     * @param string name
     * @param string version
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func settings(name: String, version: String, callback: ClientClosure<ResponseModel<AppSettingModel>>?) {
        return get(path: "app/settings/" + name + "/" + version, args: [:], callback: callback)
    }

    /**
     * Get Terms of Service and Privacy Policy content.
     *
     * Async GET /terms
     *
     * @param callback: ((String) -> Void)
     * @return String
     */
    public func terms(callback: ((String) -> Void)?) {
        return getHtml(path: "terms", callback: callback)
    }

    /**
     * Get app licenses.
     *
     * Async GET /app/licenses
     *
     * @param callback: ((String) -> Void)
     * @return String
     */
    public func licenses(callback: ((String) -> Void)?) {
        return getHtml(path: "app/licenses", callback: callback)
    }

    /**
     * Get external url links.
     *
     * Async GET /app/links
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func links(callback: ClientClosure<ResponseModelListMap<String>>?) {
        return get(path: "app/links", args: [:], callback: callback)
    }
}
