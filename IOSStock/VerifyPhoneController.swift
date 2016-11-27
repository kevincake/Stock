//
//  VerifyPhoneController.swift
//  IOSStock
//
//  Created by Eavawu on 22/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
import SwiftyJSON
class VerifyPhoneController:UIViewController{
    var verifyCode : String = ""
    var phoneNum : String = ""
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var verifyCodeTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTapVerify(_ sender: Any) {
         phoneNum = phoneTF.text!
        
        let isValid :Bool =  StringUtil().isPhoneNum(phone: phoneNum)
        guard isValid else {
            DialogUtil.showDefaultTipDialog(message: "手机号不合法", controller: self)
            return
        }
       //is phone register
        let parameters:Parameters = [
            "phone":phoneNum
        ]
        Alamofire.request(URLS.IS_PHONE_REGISTER,parameters:parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["resultCode"].int
                guard code==NetDef.SUCCESS_CODE else{
                    let tip = json["msg"].string
                    if let tip = tip{
                         DialogUtil.showDefaultTipDialog(message: tip, controller: self)
                    }
                    return;
                }
                //send sms
                self.requestSMS() //请求短信
                
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
            
        }

      
    }
    
    
    func requestSMS() {
        let parameters:Parameters = [
            "phone":phoneNum
        ]
        Alamofire.request(URLS.GET_CODE,parameters:parameters).validate().responseJSON {
            response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["resultCode"].int
                guard code==NetDef.SUCCESS_CODE else{
                    let tip = json["msg"].string
                    if let tip = tip{
                        DialogUtil.showDefaultTipDialog(message: tip, controller: self)
                    }
                    return;
                }
                //倒计时
                
                
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    @IBAction func onTapNext(_ sender: Any) {
        let paramters:Parameters = [
            "phone":phoneNum,
            "code":verifyCode,
            "country":"86"
        ]
        Alamofire.request(URLS.VERIFY_URL,parameters:paramters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["resultCode"].int
                let tip = json["msg"].string
                guard code==NetDef.SUCCESS_CODE else{
                    if let tip = tip{
                        DialogUtil.showDefaultTipDialog(message:tip , controller: self)
                    }
                    return
                }
                
                self.performSegue(withIdentifier: "verify2register", sender: self)
                
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
            
        }

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////         segue.destination as RegisterController
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
