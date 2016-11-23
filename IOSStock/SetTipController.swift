//
//  SetTipController.swift
//  IOSStock
//
//  Created by Eavawu on 21/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
import UIKit
class SetTipController:UIViewController,UITableViewDelegate,UITableViewDataSource{
     @IBOutlet weak var tiptableview: UITableView!
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.count%2==0){
          return self.tiptableview.dequeueReusableCell(withIdentifier: "edit_tip_cell")!
        }else{
          return self.tiptableview.dequeueReusableCell(withIdentifier: "switch_tip_cell")!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tiptableview.dataSource = self
        tiptableview.delegate = self
        self.automaticallyAdjustsScrollViewInsets=false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
