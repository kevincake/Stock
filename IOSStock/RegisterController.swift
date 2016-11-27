//
//  RegisterController.swift
//  IOSStock
//
//  Created by Eavawu on 22/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
class RegisterController:UIViewController{
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmpasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTapConfirm(_ sender: Any) {
        let paramters:Parameters = [
//            "phone":phoneNum,
//            "code":verifyCode,
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
                
                //带上参数.跳转到下一个界面
                
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
            
        }

    }
    @IBOutlet weak var onTapConfirm: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
