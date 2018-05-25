//
//  SingleCarDataVC.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/24/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit

//import DropDown

class SingleCarDataVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    //outlets
    @IBOutlet var carImgView : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated : true , completion : nil)
    }
    
    func imagePickerController(_ picker : UIImagePickerController , didFinishPickingMediaWithInfo info: [String : Any]){
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        carImgView.image = image
    }
    
    override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker , animated: true , completion : nil)
    }
  
    
//    func createDropDownMenu(){
//        let dropDown = DropDown()
//
//        // The view to which the drop down will appear on
//        dropDown.anchorView = view // UIView or UIBarButtonItem
//
//        // The list of items to display. Can be changed dynamically
//        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
//    }



}
