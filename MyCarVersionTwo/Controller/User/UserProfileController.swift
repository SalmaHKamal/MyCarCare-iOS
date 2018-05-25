//
//  UserProfileController.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/25/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import DropDown

class UserProfileController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var genderButtonOutlt: UIButton!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var mobileTxt: UITextField!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var chooserOutlt: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func genderAction(_ sender: UIButton) {
        dropDown.show()
    }
    @IBAction func forgetAction(_ sender: UIButton) {
        
    }
    @IBAction func chooserAction(_ sender: Any) {
        if chooserOutlt.isOn {
            chooserOutlt.setOn(false, animated:true)
        } else {
            chooserOutlt.setOn(true, animated:true)
        }
    }
    @IBAction func btnClicked(_: UIButton) {
        showPicker()
    }
    
    let dropDown = DropDown()
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        dropDownSetUp()
        chooserSetUp()
        closeEditing()
    }
   
}

// MARK: - image picker methods
extension UserProfileController{
    
    func showPicker()  {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("choosed image")
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imageView.image=chosenImage
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Table view data source
extension UserProfileController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
}
// MARK: - Drop Down Methods
extension UserProfileController{

    func dropDownSetUp(){
        dropDown.anchorView = genderLbl
        dropDown.dataSource = ["Male", "Female"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDown.hide()
            self.genderLbl.text = item
        }
    }
}

// MARK: - chooser Methods
extension UserProfileController{
    
    func chooserSetUp(){
        chooserOutlt.addTarget(self, action: #selector(stateChanged(switchState:)), for: UIControlEvents.valueChanged)
        }
    
    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            openEditing()
            print("opened")
        } else {
            closeEditing()
            print("closed")
        }
    }
    
    func openEditing() {
        self.nameTxt.isUserInteractionEnabled = true
        self.addressTxt.isUserInteractionEnabled = true
        self.mobileTxt.isUserInteractionEnabled = true
        self.emailTxt.isUserInteractionEnabled = true
        self.genderButtonOutlt.isEnabled = true
    }
    func closeEditing() {
        self.nameTxt.isUserInteractionEnabled = false
        self.addressTxt.isUserInteractionEnabled = false
        self.mobileTxt.isUserInteractionEnabled = false
        self.emailTxt.isUserInteractionEnabled = false
        self.genderButtonOutlt.isEnabled=false
        
    }
    
}

