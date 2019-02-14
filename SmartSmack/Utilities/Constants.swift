//
//  Constants.swift
//  SmartSmack
//
//  Created by Admin on 28/01/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Url constants
let BASE_URL = "https://mychattychatchatty.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//headers
let HEADER = ["Content-Type": "application/json; charset=utf-8"]
