//
//  ViewController.swift
//  02_01_2023_JSONSerialization_NestedAPIVersion2
//
//  Created by Vishal Jagtap on 15/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var productTableView: UITableView!
    var urlString : String?
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonParsing()
    }
    
    func jsonParsing(){
        urlString = "https://fakestoreapi.com/products"
        url = URL(string: urlString!)
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        urlSession = URLSession(configuration: .default)
        
        urlSession?.dataTask(with: urlRequest!) { data, response, error in
           print(response)
            let jsonResponseArray = try! JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            
            for eachJsonObject in jsonResponseArray{
                let eachProduct = eachJsonObject as! [String : Any]
                let prId = eachProduct["id"] as! Int
                let prTitle = eachProduct["title"] as! String
                let prPrice = eachProduct["price"] as! Double
                let prRating = eachProduct["rating"] as! [String : Any]  //important
                let prRate = prRating["rate"] as! Double
                let prCount = prRating["count"] as! Int
                
                let prRatingObject = Rating(rate: prRate, count: prCount)           //important
                
                let newProduct = Product(id: prId, title: prTitle, price: prPrice, rating: prRatingObject)              //important
            }
            
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        }.resume()
    }
}
//in table view bind data of rate and count by eachProduct.rating.rate
