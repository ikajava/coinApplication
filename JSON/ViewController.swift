//
//  ViewController.swift
//  JSON
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   var coinArray = [Coin]()
    
    @IBOutlet weak var tableVeiw: UITableView!
    let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/?limit=20")!
    let refreshController = UIRefreshControl()
    
    
    
    func getJSON() {
        var array = [Coin]()
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
    
            case .success(let value):
                let json = JSON(value)
                let jsonArray = json.arrayValue
                for item in jsonArray {
                    let name = item["name"].stringValue
                    let priceUSD = Double(item["price_usd"].stringValue)!
                    let priceBTC = Double(item["price_btc"].stringValue)!
                    let percent = Double(item["percent_change_24h"].stringValue)!
                    
                    let coin = Coin(name: name, priceUSD: priceUSD, priceBTC: priceBTC, percent24h: percent)
                    array.append(coin)
                   
                }
                
                self.coinArray = array
                self.refreshController.endRefreshing()
                self.tableVeiw.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshController.addTarget(self, action: #selector(ViewController.getJSON), for: UIControlEvents.valueChanged)
        tableVeiw.addSubview(refreshController)
        
        
        getJSON()
        
//        print(coinArray)
        tableVeiw.dataSource = self
        tableVeiw.delegate = self
        
      
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVeiw.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
        
        cell.priceLabel.text = String(coinArray[indexPath.row].priceUSD)
        return cell
        
    }
    

}

