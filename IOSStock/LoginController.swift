//
//  LoginController.swift
//  IOSStock
//
//  Created by Eavawu on 21/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
class LoginController:UIViewController{
    
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let account = accountTF.text! as String;
        let password = passwordTF.text! as String;
        var  isValid = StringUtil().isPhoneNum(phone: account)
        if !isValid {
            DialogUtil.showDialog(title: "提示",message: "账户名不符合规则",controller: self)
            return
        }
        let parameters: Parameters = [
            NetDef.ACCOUNT:account ,
            NetDef.PASSWORD:password
        ]
        
        Alamofire.request(URLS.LOGIN_URL,parameters: parameters).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let code = json["resultCode"].int
                    if code==NetDef.SUCCESS_CODE {
                         DialogUtil.showDialog(title: "提示",message: "登录成功",controller: self)
                    }else{
                        DialogUtil.showDialog(title: "提示",message: "账户或密码错误",controller: self)
                    }
                    print("JSON: \(json)")
                case .failure(let error):
                    print(error)
                }

    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
