//
//  ViewController.swift
//  peretz 2.0
//
//  Created by baga on 08.01.2021.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 4
        
    }
    @IBAction func toDishPage(_ sender: Any) {
        let dishPageViewController = (storyboard?.instantiateViewController(withIdentifier: "DishPage"))! as UIViewController
        dishPageViewController.modalTransitionStyle = .crossDissolve
        dishPageViewController.modalPresentationStyle = .overCurrentContext
        present(dishPageViewController, animated: true, completion: nil)

    }
    
}



