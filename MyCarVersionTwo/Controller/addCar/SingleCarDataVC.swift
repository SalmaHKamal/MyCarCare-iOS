//
//  SingleCarDataVC.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/24/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit


class SingleCarDataVC: UITableViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    //outlets
    @IBOutlet weak var carImgView : UIImageView!
    @IBOutlet weak var carNameField: UITextField!
    @IBOutlet weak var carModelField: UITextField!
    @IBOutlet weak var carYearField: UITextField!
    @IBOutlet weak var carDescField: UITextView!
    
    //variables
//    var singleCar : Car = Car(name: "" , model: "" , year: "" , desc: "" , img: "")
    var singleCar : Car?
    var delegate : updateCarListTableProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        if let car = singleCar {
            
            let img = UIImage(named : (car.image))
            carImgView.image = img
            carNameField.text = car.name
            carModelField.text = car.model
            carYearField.text = car.year
            carDescField.text = car.desc
        }

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated : true , completion : nil)
    }
    
    func imagePickerController(_ picker : UIImagePickerController , didFinishPickingMediaWithInfo info: [String : Any]){

//        let str : String = info[UIImagePickerControllerPHAsset] as! String
//        print(str)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        carImgView.image = image
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func testBtn(_ sender: Any){
        print("salma")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker , animated: true , completion : nil)
    }
  
    @IBAction func saveCarDetails(_ sender: Any) {
        if let carvar = singleCar {
            carvar.name = carNameField.text!
            carvar.model = carModelField.text!
            carvar.desc = carDescField.text!
            carvar.year = carYearField.text!
        }else{
            let newSingleCar = Car(carNameVal: carNameField.text! ,
                                   carModelVal: carModelField.text! ,
                                   carYearVal: carYearField.text! ,
                                   carDescVal: carYearField.text! ,
                                   carImageVal: "car_image.jpg")
            
            delegate?.updateTableValues(newCar: newSingleCar)
            
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
