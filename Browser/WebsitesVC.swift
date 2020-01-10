//
//  WebsitesVC.swift
//  Browser
//
//  Created by Abdykadyr Maksat on 10/4/19.
//  Copyright © 2019 Abdykadyr Maksat. All rights reserved.
//

import UIKit
import WebKit

class WebsitesVC: UITableViewController {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var segmetControl: UISegmentedControl!
    private var websites:[Website] = []
    private var favWebsites:[Website] = []
    private var isFav:Bool = false
    @IBAction func segmentChange(_ sender: Any) {
        myTableView.reloadData()
    }
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        alert(title: "Add website", message: "Fill blanks", style: .alert)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Websites"

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch segmetControl.selectedSegmentIndex {
        case 0:
            return websites.count
        case 1:
            return favWebsites.count
        default:
            break
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        switch segmetControl.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = websites[indexPath.row].title
        case 1:
            cell.textLabel?.text = favWebsites[indexPath.row].title
        default:
            break
        }
        return cell
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
    func alert(title:String,message:String,style:UIAlertController.Style){
        let alertController = UIAlertController(title:title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "save", style: .default) { (action) in
            let title = alertController.textFields?.first?.text
            let url = alertController.textFields![1].text
            let website = Website(title:title,url:URL(string: url!))
            self.websites.append(website)
            self.myTableView.reloadData()
        }
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Title"
        }
        alertController.addTextField { (textfield) in
            textfield.placeholder = "URL"
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showDetail"{
            if let navcon  = segue.destination as? UINavigationController{
                if let destination = navcon.visibleViewController as? InfoVC{
                    if let row = tableView.indexPathForSelectedRow?.row{
                        destination.url = websites[row].url!
                        isFav = destination.fav
                        if isFav == true{
                            favWebsites.append(websites[row])
                        }
                        destination.navigationItem.title = websites[row].title!
                    }
                }
            }
        }
    }
 

}
