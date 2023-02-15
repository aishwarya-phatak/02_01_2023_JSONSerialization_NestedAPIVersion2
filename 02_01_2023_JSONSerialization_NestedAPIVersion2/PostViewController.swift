//
//  PostViewController.swift
//  02_01_2023_JSONSerialization_NestedAPIVersion2
//
//  Created by Vishal Jagtap on 15/02/23.
//

import UIKit
//aaproach 2 - to parse json by using deocder
class PostViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    var posts = [Post]()
    var urlString : String?
    var url : URL?
    var urlRequest : URLRequest?
    var jsonDecoder : JSONDecoder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            jsonParsingUsingDecoder()
        
    }
    
    func jsonParsingUsingDecoder(){
        
        urlString = "https://jsonplaceholder.typicode.com/posts"
        url = URL(string: urlString!)
        urlRequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlRequest!) { data, response, error in
            print(response)
            if(error == nil){
                do{
                    self.jsonDecoder = JSONDecoder()
                    let postResponse = try self.jsonDecoder?.decode([Post].self, from: data!)
                    
                } catch{
                    print(error)
                }
            }
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
                
        }.resume()
        
    }
}
