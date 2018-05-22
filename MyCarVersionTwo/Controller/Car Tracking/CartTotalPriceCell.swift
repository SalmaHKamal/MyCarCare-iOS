//
//  CartTotalPriceCell.swift
//  
//
//  Created by Sayed Abdo on 4/28/18.
//

import UIKit

class CartTotalPriceCell: UITableViewCell {
    
    
    @IBOutlet weak var totalPriceInCart: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buyBtn(_ sender: Any) {
    }
    

}
