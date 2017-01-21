//
//  MPAboutTableViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 21/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPAboutTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 2 {
                self.openSiteAt(siteAddress: "http://www.combateacorrupcao.mpf.mp.br/10-medidas")
            }
            
            else if indexPath.row == 3 {
                self.openSiteAt(siteAddress: "https://www.facebook.com/Mude.Chega")
            }
        }
        
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                self.openSiteAt(siteAddress: "www.mpf.mp.br")
            }
            else {
                self.openSiteAt(siteAddress: "www.ifce.edu.br")
            }
        }
        
        else if indexPath.section == 2 {
            self.openSiteAt(siteAddress: "https://github.com/PrajeetShrestha/EkToast")
        }
    }
    
    fileprivate func openSiteAt(siteAddress siteAdress: String){
        UIApplication.shared.openURL(URL(string:siteAdress)!)
    }
}
