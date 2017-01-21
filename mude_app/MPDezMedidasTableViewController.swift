//
//  MPDezMedidasTableViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPDezMedidasTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    
    @IBAction func onCloseTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table View Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let cellText = cell?.textLabel?.text
        
        let actionInfo: [String:AnyObject] = [
            "index": indexPath.row as AnyObject,
            "text" : cellText! as AnyObject
        ]
        
        performSegue(withIdentifier: "fromSaibaMaisToDetalhe" , sender: actionInfo)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MPDetalheMedidaViewController,
            let actionInfo = sender as? [String:AnyObject]{
    
            destinationViewController.detailKey = actionInfo["index"] as? Int
            destinationViewController.actionTitleText = actionInfo["text"] as? String
        }
    }
}
