//
//  MyStockController.swift
//  IOSStock
//
//  Created by Eavawu on 20/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
import UIKit
class MyStockController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    @IBOutlet weak var myStockTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myStockTableView.dataSource = self
        myStockTableView.delegate = self
        self.automaticallyAdjustsScrollViewInsets=false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.myStockTableView.dequeueReusableCell(withIdentifier: "stockcell")!
    }

    
}
