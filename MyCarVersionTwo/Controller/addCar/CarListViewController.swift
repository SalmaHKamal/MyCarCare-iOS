//
//  CarListViewController.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/20/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import Floaty

class CarListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , updateCarListTableProtocol{

    //outlets
    @IBOutlet weak var carListTable: UITableView!
    
    
    
    //variables

    var listOfCars : [Int : Car ] = [0 : Car(name: "Nissan" , model: "Sunny" , year: "2000" , desc: "This is a First Car" , img: "car_image.jpg") ,
                                     1 : Car(name: "Toyota" , model: "Camry" , year: "2009" , desc: "This is a Second Car" , img: "cat-1285634_960_720.jpg") ,
                                     2 : Car(name: "BMW" , model: "Anything" , year: "2011" , desc: "This is a Third Car"  , img: "car_image.jpg") ]
    
    
    var listOfCars : [Car] = [
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carListTable.delegate = self
        carListTable.dataSource = self
        
        
        //navigation title
        self.navigationItem.title = "Car List"
        
        //floating button
        addFloatingBtn()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        self.carListTable.reloadData()
    }
    
    func addFloatingBtn(){
        
        let floaty = Floaty()
        floaty.buttonColor = UIColor.brown
        floaty.addItem(title: "new Car", handler: {item in
            
            self.openSingleCarCtrl()
        })
        
        self.view.addSubview(floaty)
    }
    
    func openSingleCarCtrl(){
        
        let detailsVc : SingleCarDataVC = storyboard?.instantiateViewController(withIdentifier:"SingleCarData") as! SingleCarDataVC
        
        detailsVc.singleCar?.carImage = "car_image.jpg"
        detailsVc.singleCar?.carName = ""
        detailsVc.singleCar?.carModel = ""
        detailsVc.singleCar?.carYear = ""
        detailsVc.singleCar?.carDescription = ""
        
        detailsVc.delegate = self
        
        self.navigationController?.pushViewController(detailsVc, animated: true)
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = carListTable.dequeueReusableCell(withIdentifier: "singleCarCell", for: indexPath)

        // get subView and add it on a cell
        let subView = CardViewController.init(frame: CGRect(x:0 , y:0 , width: 351 , height : 200))
        subView.carNameLabel.text = listOfCars[indexPath.row]?.carName
        let img = UIImage(named : (listOfCars[indexPath.row]?.carImage)!)
        subView.carImageView.image = img
        subView.closeBtn.addTarget(self, action: #selector(deleteCar(_ :)), for: .touchUpInside)
        Cell.contentView.addSubview(subView)
        
        return Cell
    }
    
    @objc func deleteCar(_ sender: Any){
        
        print("delete btn clicked")
//        let indexPath = carListTable.index
//        listOfCars.removeValue(forKey: indexPath)
//        carListTable.deleteRows(at: [indexPath!], with: .none)
        let buttonPosition : CGPoint = (sender as AnyObject).convert((sender as AnyObject).bounds.origin, to: carListTable)
        let indexPath = carListTable.indexPathForRow(at: buttonPosition)
        //let desiredCell = carListTable.cellForRow(at: indexPath!)
        
        listOfCars.removeValue(forKey: (indexPath?.row)!)
        carListTable.deleteRows(at: [indexPath!], with: .left)
        
        for i in listOfCars {
            print("key is \(i.key)")
        }
        //carListTable.reloadData()
        //carListTable.reloadRows(at: [indexPath!], with: .none)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVc : SingleCarDataVC = storyboard?.instantiateViewController(withIdentifier:"SingleCarData") as! SingleCarDataVC
        detailsVc.delegate = self
        detailsVc.singleCar = listOfCars[indexPath.row]!
      
        self.navigationController?.pushViewController(detailsVc, animated: true)
    }

    func updateTableValues(newCar: Car) {
        
        listOfCars.updateValue(newCar , forKey: listOfCars.count)
        print(listOfCars.count)
        self.carListTable.reloadData()
    }
    

}
