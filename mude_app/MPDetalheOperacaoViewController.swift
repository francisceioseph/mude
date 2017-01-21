//
//  MPDetalheOperacaoViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPDetalheOperacaoViewController: UIViewController {
    
    var titleText: String?
    var bodyText:  String?

    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = titleText
        self.detailTextView.text  = bodyText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        self.detailTextView.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
}
