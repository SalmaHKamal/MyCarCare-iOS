//
//  CarTrackingViewController.swift
//  MyCarVersionTwo
//
//  Created by Sayed Abdo on 5/19/18.
//  Copyright © 2018 Sayed Abdo. All rights reserved.
//

import UIKit

class CarTrackingViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    //outlets
    @IBOutlet weak var carTrackingTableView: UITableView!
    
    //variables
    var carTrackingItems : [String] = ["Refuel" , "Oil" , "Car Wash"]
    
    override func viewWillAppear(_ animated: Bool) {
        createAddBtn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carTrackingTableView.delegate = self
        carTrackingTableView.dataSource = self
        carTrackingTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        //carTrackingTableView.isScrollEnabled = false
        
        
        // Do any additional setup after loading the view.
    }
    
    func createAddBtn(){
        
        let addBtn = UIButton(frame: CGRect(x: 340, y: 650, width: 50, height: 50))
        //addBtn.setTitle("add", for: .normal)
        addBtn.addTarget(self, action: #selector(addCarTrackingItem), for: .touchUpInside)
        addBtn.backgroundColor = UIColor.darkGray
        addBtn.layer.cornerRadius = 0.5 * addBtn.bounds.size.width
        addBtn.clipsToBounds = true
        addBtn.setImage(UIImage(named: "addItem.png"), for: .normal)
        addBtn.backgroundImage(for: .normal)
        self.view.addSubview(addBtn)
    }
    
    @objc func addCarTrackingItem(){
        
        let addCTItemCtrl = self.storyboard?.instantiateViewController(withIdentifier: "newCarItem")
        self.navigationController?.pushViewController(addCTItemCtrl!, animated: true)
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carTrackingItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 3
//        {
//            let cell = carTrackingTableView.dequeueReusableCell(withIdentifier: "add_new_car_track", for: indexPath)
//            //cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
//            return cell
//        }
//        else
//        {
            let cell = carTrackingTableView.dequeueReusableCell(withIdentifier: "car_tracking_item", for: indexPath) as! CarTrackingCell
            cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            cell.carTrackingItem.text = carTrackingItems[indexPath.row]
            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let carTItemDetailsObj = self.storyboard?.instantiateViewController(withIdentifier: "carIDetails")
        self.navigationController?.pushViewController(carTItemDetailsObj!, animated: true)
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
