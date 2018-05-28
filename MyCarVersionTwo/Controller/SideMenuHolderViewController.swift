//
//  SideMenuHolderViewController.swift
//  NavigationDemo
//
//  Created by Yasmin Ahmed on 5/19/18.
//  Copyright © 2018 Yasmin Ahmed. All rights reserved.
//

import UIKit

class SideMenuHolderViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuHolder: UIView!
    @IBOutlet weak var statisticsBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var historyBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var aboutBtn: UIButton!
    
    var isSlideMenuHidden = true;
    var sideMenuButtons: Array<UIButton>?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuConstraint.constant = -177;
        sideMenuButtons = [statisticsBtn, vehiclesBtn, historyBtn, settingsBtn, aboutBtn];
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func showSideMenuBtn(_ sender: UIBarButtonItem) {
        if isSlideMenuHidden {
            sideMenuConstraint.constant = 0;
            for btn in sideMenuButtons! {
                btn.layer.shadowColor = UIColor.darkGray.cgColor;
                btn.layer.shadowOffset = CGSize(width: 2, height: 1);
                btn.layer.shadowRadius = 2;
                btn.layer.shadowOpacity = 1.0;
            }
            UIView.animate(withDuration: 0.3, animations:{
                self.view.layoutIfNeeded();
            });
        }
        else {
            sideMenuConstraint.constant = -177;
            UIView.animate(withDuration: 0.3, animations:{
                self.view.layoutIfNeeded();
            });
        }
        isSlideMenuHidden = !isSlideMenuHidden;
    }

}
