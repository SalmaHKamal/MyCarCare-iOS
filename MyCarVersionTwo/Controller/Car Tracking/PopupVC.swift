//
//  PopupVC.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import UIDropDown

class PopupVC: UIViewController {

    @IBOutlet weak var viewForPopup: UIView!
    @IBOutlet weak var fullPopupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        drop.center = CGPoint(x: self.viewForPopup.frame.midX, y: self.viewForPopup.frame.midY)
        drop.placeholder = "Select your country..."
        drop.options = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
        drop.didSelect { (option, index) in
//            self.label.text = "You just select \(option) at index: \(index)"
            print("You just select: \(option) at index: \(index)")
        }
        self.viewForPopup.addSubview(drop)
    }
    
    
    @IBAction func dismissPopup(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    
}
