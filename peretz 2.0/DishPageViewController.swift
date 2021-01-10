//
//  DishPageViewController.swift
//  peretz 2.0
//
//  Created by baga on 08.01.2021.
//

import UIKit
import Alamofire

class DishModel {
    var dish: Dish
    var count: Int
    
    init(dish: Dish, count: Int) {
        self.dish = dish
        self.count = count
    }
}

class DishPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dishList: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var dishArray = [DishModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dishList.delegate = self
        dishList.dataSource = self
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        getDishes()
        
        // Do any additional setup after loading the view.
    }
    
    

    func getDishes(){
        AF.request("https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278").response { response in
            
            for dish in try! JSONDecoder().decode([Dish].self, from: response.data!){
                self.dishArray.append(DishModel(dish: dish, count: 0))
            }
            
            
            self.dishList.reloadData()
            if self.dishArray.isEmpty == false{
                self.activityIndicator.stopAnimating()
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "prodCell", for: indexPath) as? TableViewCell {
            cell.setData(dish: dishArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 224.0
    }
    
    @IBAction func toMainPage(_ sender: Any) {
        let mainPageViewController = (storyboard?.instantiateViewController(withIdentifier: "MainPage"))! as UIViewController
        mainPageViewController.modalTransitionStyle = .crossDissolve
        mainPageViewController.modalPresentationStyle = .overCurrentContext
        present(mainPageViewController, animated: true, completion: nil)
    }
}
