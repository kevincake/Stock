//
//  StockTipController.swift
//  IOSStock
//
//  Created by Eavawu on 20/11/2016.
//  Copyright © 2016 Eavawu. All rights reserved.
//

import Foundation
import UIKit
class StockTipController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var stockTipTableView: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        return self.stockTipTableView.dequeueReusableCell(withIdentifier: "stockTipCell")!
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        stockTipTableView.dataSource = self
        stockTipTableView.delegate = self
        self.automaticallyAdjustsScrollViewInsets=false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
