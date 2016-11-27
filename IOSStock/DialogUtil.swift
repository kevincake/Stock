//
//  DialogUtil.swift
//  IOSStock
//
//  Created by Eavawu on 24/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//
import UIKit
import Foundation
class DialogUtil{
    static func showDialog(title:String,message:String,controller:UIViewController) {
        let alertController = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        controller.present(alertController, animated: true, completion: nil)
    }
    
    static func showDefaultTipDialog(message:String,controller:UIViewController){
        showDialog(title:"提示",message: message,controller: controller)
    }
}
