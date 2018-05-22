//
//  CartProductCell.swift
//  
//
//  Created by Sayed Abdo on 4/28/18.
//

import UIKit

class CartProductCell: UITableViewCell {
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productTotalPrice: UILabel!
    @IBOutlet weak var xImage: UIImageView!
    //static var tagCounter = 0
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let singleTap = UITapGestureRecognizer(target: self, action: #selector(xImageClicked(singleTap:)))
//
//        xImage.isUserInteractionEnabled = true
//        xImage.addGestureRecognizer(singleTap)
//        xImage.tag = CartProductCell.tagCounter
//        CartProductCell.tagCounter += 1
    }
    
    @objc func xImageClicked(singleTap : UITapGestureRecognizer){
        
        let clickedImage = singleTap.view as! UIImageView
        print("image clicked with tag number \(clickedImage.tag)")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

}
