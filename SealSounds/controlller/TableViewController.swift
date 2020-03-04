//
//  TableViewController.swift
//  SealSounds
//
//  Created by Samuel Germain on 2019-12-07.
//  Copyright © 2019 Sam G. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TableViewController: UITableViewController {

    var products: [SKProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        products = []
        
        Products.store.requestProducts{ [weak self] success, products in
          guard let self = self else { return }
          if success {
            self.products = products!
          }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(invalidRestore), name: NSNotification.Name(rawValue: "InvalidRestore"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(purchasesRestored), name: NSNotification.Name(rawValue: "PurchasesRestored"), object: nil)
        
    }
    
    @objc private func invalidRestore(){
        let alert = UIAlertController(title: "Geaaaagh", message: "You have no purchases to restore", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: false)
    }
    
    @objc private func purchasesRestored(){
        let alert = UIAlertController(title: "Purchases Restored", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: false)
    }
    
    func buyPremium() {
        for prod in self.products{
          if prod.productIdentifier == Products.premium{
            if Products.store.isProductPurchased(prod.productIdentifier){
              Products.store.restorePurchases()
            }else if IAPHelper.canMakePayments(){
              Products.store.buyProduct(prod)
            }else{
              let alert = UIAlertController(title: "Cannot make payments", message: "You are not authorized to make payments on this device", preferredStyle: .alert )
              let action = UIAlertAction(title: "OK", style: .default, handler: nil)
              alert.addAction(action)
              self.present(alert, animated: true)
            }
          }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    var choices = ["Buy Premium", "Restore Premium"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return choices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Choice", for: indexPath)
        cell.textLabel?.text = choices[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1{
            Products.store.restorePurchases()
        }else{
            buyPremium()
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
