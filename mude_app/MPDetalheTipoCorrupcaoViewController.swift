//
//  MPDetalheTipoCorrupcaoViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

class MPDetalheTipoCorrupcaoViewController: UIViewController {

    var index: Int?
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailBody: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = self.index,
            let detailCorruptionDic = readPlistAtIndex(index){
                
                self.detailTitle.text = detailCorruptionDic["title"] as? String
                self.detailBody.text  = detailCorruptionDic["text"]  as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.detailBody.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    func readPlistAtIndex(_ index: Int) -> NSDictionary? {
        var dic: NSDictionary?
        
        if let path = Bundle.main.path(forResource: "MPTiposCorrupcao", ofType: "plist"),
            let array = NSArray(contentsOfFile: path) {
                dic = array[index] as? NSDictionary
        }
        
        return dic
    }

}
