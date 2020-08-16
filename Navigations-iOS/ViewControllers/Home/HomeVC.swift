//
//  HomeVC.swift
//  Training-iOS
//
//  Created by Dushan Saputhanthri on 28/5/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var valueToSend: String = "Amazing Title"

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: Push to VC in other Storybord using segue
    @IBAction func pushToVCInOtherSBUSingSBReference(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ShowDetailsOtherSB", sender: self.valueToSend)
    }
    
    

    //MARK: Push to VC in same Storybord using segue
    @IBAction func pushWithIndirectSegue(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ShowDetailsWithPush", sender: self.valueToSend)
    }
    
    
    
    //MARK: Present VC in same Storybord using segue
    @IBAction func presenthWithIndirectSegue(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ShowDetailsWithPresent", sender: self.valueToSend)
    }
    
    /* -------------------------------------------------------------------------------------- */
    
    //MARK: Push to VC in same Storybord using code
    @IBAction func pushWithCode(_ sender: UIButton) {
        self.pushToDetailsVC(sbId: "Auth", vcId: "DetailsVC", data: self.valueToSend)
    }
    
    //MARK: Push to Details VC
    func pushToDetailsVC(sbId: String, vcId: String, data: String?) {
        
        let storyboard = UIStoryboard(name: sbId, bundle: nil)
        let destVc = storyboard.instantiateViewController(identifier: vcId) as! DetailsVC
        destVc._title = data
        self.navigationController?.pushViewController(destVc, animated: true)
    }
    
    /* -------------------------------------------------------------------------------------- */
    
    //MARK: Present VC in same Storybord using code
    @IBAction func presentWithCode(_ sender: UIButton) {
        self.presentDetailsVC(sbId: "Auth", vcId: "DetailsVC", data: self.valueToSend)
    }
    
    //MARK: Present Details VC
    func presentDetailsVC(sbId: String, vcId: String, data: String?) {
        
        let storyboard = UIStoryboard(name: sbId, bundle: nil)
        let destVc = storyboard.instantiateViewController(identifier: vcId) as! DetailsVC
        destVc._title = data
        self.present(destVc, animated: true, completion: nil)
    }
    
    /* -------------------------------------------------------------------------------------- */
    
    //MARK: Push to VC in other Storyboard using code
    @IBAction func pushWithCodeToVCInOtherSB(_ sender: UIButton) {
        self.pushToInfoVC(sbId: "Home", vcId: "InfoVC", data: self.valueToSend)
    }
    
    //MARK: Push to Info VC
    func pushToInfoVC(sbId: String, vcId: String, data: String?) {
        
        let storyboard = UIStoryboard(name: sbId, bundle: nil)
        let destVc = storyboard.instantiateViewController(identifier: vcId) as! InfoVC
        destVc._title = data
        self.navigationController?.pushViewController(destVc, animated: true)
    }
    
    /* -------------------------------------------------------------------------------------- */
    
    //MARK: Present VC in other Storyboard using code
    @IBAction func presentWithCodeToVCInOtherSB(_ sender: UIButton) {
        self.presentInfoVC(sbId: "Home", vcId: "InfoVC", data: self.valueToSend)
    }
    
    //MARK: Present Details VC
    func presentInfoVC(sbId: String, vcId: String, data: String?) {
        
        let storyboard = UIStoryboard(name: sbId, bundle: nil)
        let destVc = storyboard.instantiateViewController(identifier: vcId) as! InfoVC
        destVc._title = data
        self.present(destVc, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetailsOtherSB" {
            
            let dest = segue.destination as! InfoVC
            if let _title = sender as? String {
                dest._title = _title
            }
            
        }
        
        else if segue.identifier == "ShowDetailsWithPush" {
            
            let dest = segue.destination as! DetailsVC
            if let _title = sender as? String {
                dest._title = _title
            }
            
        }
        
        else if segue.identifier == "ShowDetailsWithPresent" {
            
            let dest = segue.destination as! DetailsVC
            if let _title = sender as? String {
                dest._title = _title
            }
            
        }
    }

}
