//
//  CarListViewController.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/20/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController {

    @IBOutlet weak var carImage: UIImageView!
    //var choosedImageName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subView : CardViewController = CardViewController(frame: CGRect(x:100,y:100,width:379,height:86))
        self.view.addSubview(subView)
        
//        let imageClick = UITapGestureRecognizer()
//        imageClick.addTarget(self, action: #selector(browseCarImage))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func browseCarImage(){
    
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
