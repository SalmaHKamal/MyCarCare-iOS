//
//  CartViewController.swift
//  MyCarApp
//
//  Created by Yasmin Ahmed on 4/27/18.
//  Copyright © 2018 Yasmin Ahmed. All rights reserved.
//

import UIKit

class CartViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var cartTableView: UITableView!
    var numberOfRows = 8
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        cartTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        //navigation bar
        let cartImage = UIImage(named: "cart.jpg")
        self.navigationItem.titleView = UIImageView(image: cartImage)
        
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 7
        {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "cart_product_last_cell", for: indexPath) as! CartTotalPriceCell
            cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            return cell
        }
        else
        {
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "cart_product_cell", for: indexPath) as! CartProductCell
            cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("row \(indexPath.row) selected")
//        let cell = cartTableView.dequeueReusableCell(withIdentifier: "cart_product_cell" , for: indexPath) as! CartProductCell
//
//        let singleTap = UITapGestureRecognizer(target: self, action: #selector(xImageClicked(singleTap:)))
//
//        cell.xImage.isUserInteractionEnabled = true
//        cell.xImage.addGestureRecognizer(singleTap)
//        cell.xImage.tag = indexPath.row
        
    }
    
    @objc func xImageClicked(singleTap : UITapGestureRecognizer){
        
        let clickedImage = singleTap.view as! UIImageView
        print("image clicked with tag number \(clickedImage.tag)")
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        numberOfRows -= 1
        self.cartTableView.deleteRows(at: [indexPath], with: .right)
        
        //cartTableView.reloadData()
        
    }
    
    
    @IBAction func increaseBtn(_ sender: Any) {
        
        let buttonPosition : CGPoint = (sender as AnyObject).convert((sender as AnyObject).bounds.origin, to: cartTableView)
        let indexPath = cartTableView.indexPathForRow(at: buttonPosition)
        let desiredCell = cartTableView.cellForRow(at: indexPath!) as! CartProductCell
        var currentQuantity = 1 //Int(desiredCell.productQuantity.text!)
        currentQuantity += 1
        desiredCell.productQuantity.text = String(describing: currentQuantity)
        cartTableView.reloadRows(at: [indexPath!], with: .none)
        
//        print("you are in row \(String(describing: indexPath?.row))")
    }
    
    
    
    @IBAction func decreaseBtn(_ sender: Any) {
    }
    @IBAction func buyBtn(_ sender: Any) {
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
