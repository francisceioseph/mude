//
//  MPDownloadTableViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPDownloadTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = MPUrls.urlForIndexPath(indexPath) {
            MPDownloader(viewController: self).download(url)
        }
        
    }
}
