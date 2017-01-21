//
//  MPDetalheMedidaViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPDetalheMedidaViewController: UIViewController {
    
    var detailKey: Int?
    var actionTitleText: String?
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var actionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailKey = self.detailKey,
            let actionTitleText = self.actionTitleText{
                
            navigationTitle.title = "#medida\(detailKey + 1)"
            actionTitle.text = actionTitleText
            actionText.text  = readPlistAtIndex(detailKey)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        self.actionText.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    func readPlistAtIndex(_ index: Int) -> String?{
        var text:String?
        
        if let path = Bundle.main.path(forResource: "MPDetalhesDezMedidas", ofType: "plist"),
            let detailsDic = NSDictionary(contentsOfFile: path) {
    
                text = detailsDic["medida\(index)"] as? String
                
        }
        
        return text
    }
    
    

}
