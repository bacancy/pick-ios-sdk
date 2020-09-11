//
//  UserClient.swift
//  PickSDK
//
//  Created by Howard Cantrell Jr on 8/22/18.
//  Copyright © 2018 Pick Ride Network, Inc. All rights reserved.
//

import UIKit

public class UserClient: PickClient {

    /**
     * Get new mfa data and/or send code to sms.
     *
     * Async GET /user/mfa?sms=sms&smsPhone=smsPhone&smsCarrierId=smsCarrierId
     *
     * @param args: [String: String]
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func getMfa(args: [String: String], callback: ClientClosure<ResponseModel<UserModel>>?) {
        return get(path: "user/mfa", args: args, callback: callback)
    }

    /**
     * Verify new user phone number.
     *
     * Async POST /user/phone
     * {
     *   "phone": smsPhone,
     *   "app": "drive"
     * }
     *
     * @param string phone
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func phone(phone: String, appName: String, callback: ClientClosure<ResponseModel<VerifyCodeModel>>?) {
        let cleanPhoneNumber = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let args = [
            "phone": cleanPhoneNumber,
            "app": appName
        ]
        return post(path: "user/phone", args: args, callback: callback)
    }

    /**
     * Get user info.
     *
     * Async GET /user/token/info
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func info(token: String = "", callback: ClientClosure<ResponseModel<UserModel>>?) {
        if (token.isEmpty) {
            return get(path: "user", args: [:], callback: callback)
        }
        return get(path: "user/" + token + "/info", args: [:], callback: callback)
    }

    /**
     * Resend the email verification email.
     *
     * Async GET /user/resend?email=email
     *
     * @param string email
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func resendVerify(email: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["email": email]
        return get(path: "user/resend", args: args, callback: callback)
    }

    /**
     * Verify email from code sent to new email.
     *
     * Async GET /user/verify?email=email&code=code
     *
     * @param string email
     * @param string code
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func verifyEmail(email: String, code: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "email": email,
            "code": code
        ]
        return get(path: "user/verify", args: args, callback: callback)
    }

    /**
     * User account login and get the bearer token.
     *
     * Async POST /user/login
     * {
     *   "phone": phone,
     *   "code": code,
     *   "client_key": client_key,
     *   "api_key": api_key
     * }
     *
     * @param string phone
     * @param string code
     * @param string client_key
     * @param string api_key
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func login(phone: String, code: String, client_key: String?, api_key: String?, callback: ClientClosure<LoginModel>?) {

        let cleanPhoneNumber = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        var args = [
            "phone": cleanPhoneNumber,
            "code": code
        ]

        if (api_key != nil && !api_key!.isEmpty) {
            args["api_key"] = api_key
        } else if (client_key != nil && !client_key!.isEmpty) {
            args["client_key"] = client_key
        }

        return post(path: "user/login", args: args, callback: callback)
    }

    /**
     * Forgot password, send reset email.
     *
     * Async GET /user/forgot?email=email
     *
     * @param string email
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func forgot(email: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["email": email]
        return get(path: "user/forgot", args: args, callback: callback)
    }

    /**
     * Reset password from email link.
     *
     * Async PUT /user/reset
     * {
     *   "email": email,
     *   "newPassword": newPassword,
     *   "code": code
     * }
     *
     * @param string email
     * @param string newPassword
     * @param string code
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func reset(email: String, newPassword: String, code: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "email": email,
            "newPassword": newPassword,
            "code": code
        ]

        return put(path: "user/reset", args: args, callback: callback)
    }

    /**
     * Delete current user.
     *
     * Async DELETE /user?confirmed=confirmed
     *
     * @param int confirmed
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deleteUser(confirmed: Bool, password: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["password": password]
        return delete(path: String(format: "user?confirmed=%@", confirmed.description), args: args, callback: callback)
    }

    /**
     * Change current user's password.
     *
     * Async PUT /user/password
     * {
     *   "password": password,
     *   "newPassword": newPassword
     * }
     *
     * @param string password
     * @param string newPassword
     * @param string code
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func password(password: String, newPassword: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "password": password,
            "newPassword": newPassword
        ]

        return put(path: "user/password", args: args, callback: callback)
    }

    /**
     * Change current user's email.
     *
     * Async PUT /user/email
     * {
     *   "newEmail": newEmail
     * }
     *
     * @param string newEmail
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func email(newEmail: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "newEmail": newEmail
        ]

        return put(path: "user/email", args: args, callback: callback)
    }

    /**
     * Update current user's first and last name.
     *
     * Async PUT /user/name
     * {
     *   "titleName": titleName,
     *   "firstName": firstName,
     *   "lastName": lastName
     * }
     *
     * @param string titleName
     * @param string firstName
     * @param string lastName
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func fullname(titleName: String, firstName: String, middleName: String, lastName: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "titleName": titleName,
            "firstName": firstName,
            "middleName": middleName,
            "lastName": lastName
        ]
        return put(path: "user/name", args: args, callback: callback)
    }

    /**
     * Update current user's profile.
     *
     * PUT /user
     * {
     *   "firstName" : firstName,
     *   "lastName" : lastName
     *   "lastName" : lastName,
     *   "hometown" : hometown,
     *   "music" : music,
     *   "about" : about
     * }
     *
     * @param string firstName
     * @param string lastName
     * @param string hometown
     * @param string music
     * @param string about
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func update(firstName: String, lastName: String, hometown: String, music: String, about: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "firstName": firstName,
            "lastName": lastName,
            "hometown": hometown,
            "music": music,
            "about": about
        ];

        return put(path: "user", args: args, callback: callback)
    }

    /**
     * Update current user's profile photo.
     *
     * Async POST /user/photo
     * {
     *   "image" : image
     * }
     *
     * @param UIImage image
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func photo(image: UIImage, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var imageBase64 = ""

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            imageBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }

        let args = [
            "image": imageBase64
        ];
        return put(path: "user/photo", args: args, callback: callback)
    }

    /**
     * Change current user's phone number.
     *
     * Async PUT /user/phone
     * {
     *   "phone" : phone,
     *   "code" : code
     * }
     *
     * @param string phone
     * @param string code
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func phoneUpdate(phone: String, code: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let cleanPhoneNumber = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        let args = [
            "phone": cleanPhoneNumber,
            "code": code
        ]

        return put(path: "user/phone", args: args, callback: callback)
    }

    /**
     * Update current user's ssn.
     *
     * Async PUT /user/ssn
     * {
     *   "ssn" : ssn
     * }
     *
     * @param string ssn
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func ssn(ssn: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "ssn": ssn
        ]

        return put(path: "user/ssn", args: args, callback: callback)
    }

    /**
     * Update current user's company / tin info.
     *
     * Async PUT /user/tin
     * {
     *   "company" : company,
     *   "tin" : tin,
     *   "useSsn": useSsn
     * }
     *
     * @param string ssn
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func tin(company: String?, tin: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var args: [String: Any] = [
            "tin": tin,
            "useSsn": false
        ]

        if let company = company {
            args["company"] = company
        }

        return put(path: "user/tin", args: args, callback: callback)
    }

    /**
     * Change user's phone number with a password
     *
     * Async PUT /user/recovery
     * {
     *   "phone" : phone,
     *   "newPhone" : newPhone,
     *   "password" : password
     * }
     *
     * @param string phone
     * @param string newPhone
     * @param string password
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func recovery(phone: String, newPhone: String, password: String, callback: ClientClosure<ResponseModel<Model>>?) {
        let cleanPhoneNumber = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let cleanNewPhoneNumber = newPhone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        let args = [
            "phone": cleanPhoneNumber,
            "newPhone": cleanNewPhoneNumber,
            "password": password
        ]

        return put(path: "user/recovery", args: args, callback: callback);
    }

    /**
     * Change current user's notification settings
     *
     * Async PUT /user/notif
     * {
     *   "notifAccount" : notifAccount,
     *   "notifNews" : notifNews
     * }
     *
     * @param boolean account
     * @param boolean news
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func notif(account: Bool, news: Bool?, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var args = [
            "notifAccount": account ? "1" : "0"
        ]
        if (news != nil) {
            args["notifNews"] = news! ? "1" : "0"
        }

        return put(path: "user/notif", args: args, callback: callback)
    }

    /**
     * Update current user's terms agreement
     *
     * Async PUT /user/terms
     * {
     *   "termsAgreement" : termsAgreement
     * }
     *
     * @param boolean termsAgreement
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func terms(termsAgreement: Bool, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "termsAgreement": termsAgreement ? "1" : "0"
        ]

        return put(path: "user/terms", args: args, callback: callback)
    }

    /**
     * Get metroplex by latitude / longitude.
     *
     * Async GET /user/metroplex/{latitude}/{longitude}
     *
     * @param Double latitude
     * @param Double longitude
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func metroplex(latitude: Double, longitude: Double, callback: ClientClosure<ResponseModel<MetroplexModel>>?) {
        return get(path: "user/metroplex/" + String(latitude) + "/" + String(longitude), args: [:], callback: callback)
    }

    /**
     * Get metroplex by postal code.
     *
     * Async GET /user/metroplex/{postalCode}
     *
     * @param String postalCode
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func metroplex(postalCode: String, callback: ClientClosure<ResponseModel<MetroplexModel>>?) {
        return get(path: "user/metroplex/" + postalCode, args: [:], callback: callback)
    }

    /**
     * Logout current user's authorizations.
     *
     * Async GET /user/logout
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func logout(callback: ClientClosure<ResponseModel<Model>>?) {
        return get(path: "user/logout", args: [:], callback: { (result: ResponseModel<Model>?) in
            // clear session
            PickClient.accessToken = nil
            callback?(result)
        })
    }

    /**
     * Logout all of user's authorizations.
     *
     * Async GET /user/logout/all
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func logoutAll(callback: ClientClosure<ResponseModel<UserModel>>?) {
        return get(path: "user/logout/all", args: [:], callback: { (result: ResponseModel<UserModel>?) in
            // clear session
            PickClient.accessToken = nil
            callback?(result)
        })
    }

    /**
     * Get current user's friends.
     *
     * Async GET /user/friends
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func friends(callback: ClientClosure<ResponseModelList<UserModel>>?) {
        return get(path: "user/friends", args: [:], callback: callback)
    }

    /**
     * Save user to friends.
     *
     * Async POST /user/friends/{token}
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func addFriend(token: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        return post(path: "user/friends/" + token, args: [:], callback: callback)
    }

    /**
     * Remove user from friends.
     *
     * Async DELETE /user/friends/{token}
     *
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func deleteFriend(token: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        return delete(path: "user/friends/" + token, args: [:], callback: callback)
    }

    /**
     * Send current user's mfa code to email.
     *
     * Async POST /user/mfa
     * {
     *   "password": password
     * }
     *
     * @param string password
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func mfaSend(password: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["password": password]
        return post(path: "user/mfa", args: args, callback: callback)
    }

    /**
     * Change current user mfa.
     *
     * Async PUT /user/mfa
     * {
     *   "password": password,
     *   "oldCode": oldCode,
     *   "secret": secret,
     *   "code": code,
     *   "sms": sms,
     *   "smsPhone": smsPhone,
     *   "smsCarrierId": smsCarrierId
     * }
     *
     * @param args: [String: String]
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func mfaReset(args: [String: String], callback: ClientClosure<ResponseModel<UserModel>>?) {
        return put(path: "user/mfa", args: args, callback: callback)
    }

    /**
     * Report a user.
     *
     * Async POST /user/report
     *
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func report(userToken: String, section: String, reason: String, callback: ClientClosure<ResponseModel<Model>>?) {
        let args = [
            "userToken": userToken,
            "section": section,
            "reason": reason
        ]
        return post(path: "user/report", args: args, callback: callback)
    }

    /**
     * Register current user's device.
     *
     * PUT /user/device
     * {
     *   "platform" : platform,
     *   "app" : app
     *   "uniqueId" : uniqueId,
     *   "token" : token
     * }
     *
     * @param string platform
     * @param string app
     * @param string uniqueId
     * @param string token
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func register(app: String, uniqueId: String, token: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "platform": "ios",
            "app": app,
            "uniqueId": uniqueId,
            "token": token
        ];

        return put(path: "user/device", args: args, callback: callback)
    }

    /**
     * Unregister current user's device.
     *
     * DELETE /user/device
     * {
     *   "platform" : platform,
     *   "app" : app
     *   "uniqueId" : uniqueId
     * }
     *
     * @param string platform
     * @param string app
     * @param string uniqueId
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func unregister(app: String, uniqueId: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = [
            "platform": "ios",
            "app": app,
            "uniqueId": uniqueId
        ];

        return delete(path: "user/device", args: args, callback: callback)
    }

    /**
     * Submit user's referral team.
     *
     * Async PUT /user/team
     * {
     *   "teamId": teamId
     * }
     *
     * @param string teamId
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func userReferralTeam(teamId: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["teamId": teamId]
        return put(path: "user/team", args: args, callback: callback)
    }

    /**
     * Submit user's referral team by phone.
     *
     * Async GET /user/camelot?refCode=%phoneNumber
     *
     * @param string phoneNumber
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func referrerByRefCode(refCode: String, callback: ClientClosure<ResponseModel<ReferrerModel>>?) {
        return get(path: String(format: "user/camelot?refCode=%@", refCode), callback: callback)
    }

    /**
     * Submit user referrer by code (convenience method).
     *
     * @param string refByCode
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func userReferral(refByCode: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        return userRefByCode(refByCode: refByCode, refByExternal: nil, callback: callback)
    }

    /**
     * Submit user no referral (convenience method).
     *
     * @param string refByExternal
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func userNoReferral(refByExternal: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        return userRefByCode(refByCode: nil, refByExternal: refByExternal, callback: callback)
    }

    /**
     * Submit user referral.
     *
     * Async PUT /user/refbycode
     * {
     *   "refByCode": refByCode,
     *   "refByExternal": refByExternal
     * }
     *
     * @param string refByCode
     * @param string refByExternal
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func userRefByCode(refByCode: String? = nil, refByExternal: String? = nil, callback: ClientClosure<ResponseModel<UserModel>>?) {
        var args: [String: String] = [:]
        if let refByCode = refByCode {
            args["refByCode"] = refByCode
        } else {
            args["refByCode"] = "joi"
        }

        if let refByExternal = refByExternal {
            args["refByExternal"] = refByExternal
        }

        return put(path: "user/refbycode", args: args, callback: callback)
    }

    /**
     * Submit user's referral date of birth.
     *
     * Async PUT /user/dob
     * {
     *   "dob": dob
     * }
     *
     * @param string dob
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func dob(dob: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["dob": dob]
        return put(path: "user/dob", args: args, callback: callback)
    }

    /**
     * Submit user's T-shirt size.
     *
     * Async PUT /user/tshirt
     * {
     *   "size": size
     * }
     *
     * @param string size
     * @param callback: ClientClosure?
     * @return stdClass
     */
    public func tshirt(size: String, callback: ClientClosure<ResponseModel<UserModel>>?) {
        let args = ["size": size]
        return put(path: "user/tshirt", args: args, callback: callback)
    }
}
