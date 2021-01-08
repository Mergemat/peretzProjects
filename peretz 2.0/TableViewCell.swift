//
//  TableViewCell.swift
//  week 2
//
//  Created by baga on 02/01/2021.
//  Copyright © 2021 baga. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishPriceLabel: UILabel!
    @IBOutlet weak var offerCountLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var isNewImage: UIImageView!
    
    
    var dish: DishModel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setData(dish: DishModel){
        self.dish = dish
        
        dishNameLabel.sizeThatFits(CGSize(width: 188, height: 54))
        dishNameLabel.numberOfLines = 2
        dishNameLabel.text = dish.dish.name
        
        dishDescriptionLabel.text = "Обжаренное куриное филе, отварная морковь, яйца, маринованный лук, майонез"
        dishDescriptionLabel.sizeThatFits(CGSize(width: 206, height: 59))
        
        dishPriceLabel.text = "\(dish.dish.price) ₽"
        if dish.dish.new{
            isNewImage.isHidden = false
        }
        if UserDefaults.standard.integer(forKey: String(dish.dish.id)) == nil{
            UserDefaults.standard.set(self.dish.count, forKey: String(dish.dish.id))
        }
        dish.count = UserDefaults.standard.integer(forKey: String(dish.dish.id))
        offerCountLabel.text = String(dish.count)
        let url = URL(string: dish.dish.image)
        dishImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeholder.png"), completed: nil)
        showHideCount()

    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        self.dish.count += 1
        
        offerCountLabel.text = "\(self.dish.count)"
        UserDefaults.standard.set(self.dish.count, forKey: String(dish.dish.id))
        showHideCount()
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        
        guard self.dish.count > 0 else { return }
        
        self.dish.count -= 1
        offerCountLabel.text = "\(self.dish.count)"
        UserDefaults.standard.set(self.dish.count, forKey: String(dish.dish.id))
        showHideCount()
    }
    
    
    private func showHideCount() {
        var isHidden = false
        print("----------")
        print(self.dish.count)
        
        if self.dish.count < 1 {
            isHidden = true
        } else {
            isHidden = false
        }
        print(offerCountLabel.text)
        print("----------")
        self.offerCountLabel.isHidden = isHidden
        self.minusButton.isHidden = isHidden

    }
}
