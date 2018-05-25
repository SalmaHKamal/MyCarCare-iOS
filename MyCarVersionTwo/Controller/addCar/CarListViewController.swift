//
//  CarListViewController.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/20/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit
import Floaty

class CarListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{


    //outlets
    @IBOutlet weak var carListTable: UITableView!
    
    
    
    //variables
    var listOfCars = ["Nissan" , "Toyota" , "BMW"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carListTable.delegate = self
        carListTable.dataSource = self
        
        //navigation title
        self.navigationItem.title = "Car List"
        
        //floating button
        addFloatingBtn()
    }
    
    func addFloatingBtn(){
        
        let floaty = Floaty()
        floaty.buttonColor = UIColor.brown
        floaty.addItem(title: "Hello", handler: {item in
            let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //fab.close()
            
        })
        //floaty.addItem(title: "Hello")
        self.view.addSubview(floaty)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = carListTable.dequeueReusableCell(withIdentifier: "singleCarCell", for: indexPath)
        
    
        
        // get subView
        let subView = CardViewController.init(frame: CGRect(x:0 , y:0 , width: 351 , height : 200))
        subView.carNameLabel.text = listOfCars[indexPath.row]
        Cell.contentView.addSubview(subView)
        
        return Cell
    }
    
    
    

}
