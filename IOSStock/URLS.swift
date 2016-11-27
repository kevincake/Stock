//
//  URLS.swift
//  IOSStock
//
//  Created by Eavawu on 23/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//
class URLS{
    static let BASEURL = "http://localhost:8080"
    static let REGISTER_URL = BASEURL+"/sign/signUp"//注册
    static let LOGIN_URL = BASEURL+"/sign/signIn"//登录
    static let VERIFY_URL = BASEURL+"sign/verify"//验证短信
    static let IS_PHONE_REGISTER = BASEURL + "sign/isPhoneRegister"//手机号是否已经注册
    static let GET_CODE = BASEURL+"sign/getcode"

}

