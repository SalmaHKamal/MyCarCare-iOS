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
            
            let img = UIImage(named : (car.carImage))
            carImgView.image = img
            carNameField.text = car.carName
            carModelField.text = car.carModel
            carYearField.text = car.carYear
            carDescField.text = car.carDescription
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
            carvar.carName = carNameField.text!
            carvar.carModel = carModelField.text!
            carvar.carDescription = carDescField.text!
            carvar.carYear = carYearField.text!
        }else{
            let newSingleCar = Car(name: carNameField.text! ,
                                   model: carModelField.text! ,
                                   year: carYearField.text! ,
                                   desc: carYearField.text! ,
                                   img: "car_image.jpg")
            
            delegate?.updateTableValues(newCar: newSingleCar)
            
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
