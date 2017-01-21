//
//  MPTiposCorrupcaoTableViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPTiposCorrupcaoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetalheCorrupcao", sender: indexPath.row)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detalheCorrupcao = segue.destination as! MPDetalheTipoCorrupcaoViewController
        detalheCorrupcao.index = sender as? Int
    }
    
    @IBAction func onCloseTap(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
