//
//  MPAtuacoesCollectionViewController.swift
//  mude_app
//
//  Created by Francisco José A. C. Souza on 19/12/15.
//  Copyright © 2015 Francisco José A. C. Souza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "operacoes_cell"

class MPAtuacoesCollectionViewController: UICollectionViewController {

    var datasource: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = readAtuacoesFromPlist();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfItems = 0
        
        if let datasource = self.datasource {
            numberOfItems = datasource.count
        }
        
        return numberOfItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MPOperacoesCollectionViewCell
        
        if let datasource = self.datasource,
            let cellContent = datasource[indexPath.row] as? NSDictionary{
                
                cell.textLabel.text  = cellContent["title"] as? String
                cell.imageView.image = UIImage(named: (cellContent["icon"] as? String)!)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let datasource = self.datasource {
            performSegue(withIdentifier: "toOperacoesDetail", sender: datasource[indexPath.row])
        }
    }
    
    @IBAction func onCloseTap(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func readAtuacoesFromPlist() -> NSArray? {
        
        var array: NSArray?
        
        if let path = Bundle.main.path(forResource: "MPAtuacoes", ofType: "plist") {
            array = NSArray(contentsOfFile: path)
        }
        
        return array
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let operacaoDetails = sender as? NSDictionary {
            let destinationViewController  = segue.destination as! MPDetalheOperacaoViewController
            
            destinationViewController.titleText = operacaoDetails["title"] as? String
            destinationViewController.bodyText  = operacaoDetails["text"]  as? String
        }
    }
}
