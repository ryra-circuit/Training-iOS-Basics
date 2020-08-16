//
//  SignUpVC.swift
//  Training-iOS
//
//  Created by Dushan Saputhanthri on 1/6/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signUpTypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var emailUnderlineView: UIView!
    
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var phoneUnderlineView: UIView!
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfLocation: UITextField!
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var phoneStackView: UIStackView!
    
    var lastSelectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegatesForTextFields()
        
        self.manageUIWithSegments(index: 0)
    }
    
    func delegatesForTextFields() {
        
        tfEmail.delegate = self
        tfPhone.delegate = self
        tfLocation.delegate = self
    }
    
    // Hide the keyboard when tap background
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: This is segment change action
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        view.endEditing(true)
        
        print("**** Did select segment \(sender.selectedSegmentIndex)")
        
//        switch sender.selectedSegmentIndex {
//        case 0:
//            self.shouldUpdateUIWithSegmentChange(index: 0)
//        default:
//            self.shouldUpdateUIWithSegmentChange(index: 1)
//        }
        
        self.shouldUpdateUIWithSegmentChange(index: sender.selectedSegmentIndex)
    }
    
    //MARK: This is custom segment change action
    @IBAction func didTapOnSegment(_ sender: UIButton) {
        view.endEditing(true)
        
//        switch sender.tag {
//        case 0:
//            self.shouldUpdateUIWithSegmentChange(index: 0)
//        default:
//            self.shouldUpdateUIWithSegmentChange(index: 1)
//        }
        
        self.shouldUpdateUIWithSegmentChange(index: sender.tag)
    }
    
    //MARK: This is sign up action
    @IBAction func didTapOnSignUp(_ sender: UIButton) {
        view.endEditing(true)
        
        self.goToDetailPage(isPush: true)
    }
    
    func goToDetailPage(isPush: Bool) {
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let destVC = storyboard.instantiateViewController(identifier: "WelcomeVC") as! WelcomeVC
        destVC._title = "PV = nRT"
        
        switch isPush {
        case true:
            self.navigationController?.pushViewController(destVC, animated: true)
        default:
            self.present(destVC, animated: true, completion: nil)
        }
    }

}

extension SignUpVC {
    
    func shouldUpdateUIWithSegmentChange(index: Int) {
        
//        switch index {
//        case 0:
//            btnEmail.setTitleColor(.red, for: .normal)
//            emailUnderlineView.backgroundColor = .red
//
//            btnPhone.setTitleColor(.black, for: .normal)
//            emailUnderlineView.backgroundColor = .clear
//
//        default:
//            btnPhone.setTitleColor(.red, for: .normal)
//            emailUnderlineView.backgroundColor = .red
//
//            btnEmail.setTitleColor(.black, for: .normal)
//            emailUnderlineView.backgroundColor = .clear
//        }
        
        guard self.lastSelectedIndex != index else {
            return
        }
        
        print("**** Did select custom segment \(index)")
        self.manageUIWithSegments(index: index)
    }
    
    // MARK: Manage UIs of segments
    func manageUIWithSegments(index: Int) {
        
        lastSelectedIndex = index
        
        signUpTypeSegmentedControl.selectedSegmentIndex = index
        
        btnEmail.setTitleColor(index == 0 ? .red : .black, for: .normal)
        emailUnderlineView.backgroundColor = index == 0 ? .red : .clear
        
        btnPhone.setTitleColor(index == 1 ? .red : .black, for: .normal)
        phoneUnderlineView.backgroundColor = index == 1 ? .red : .clear
        
        // Add / remove subviews
        self.showContentsIfNeeded(index: index)
    }
    
    func showContentsIfNeeded(index: Int) {
        
        switch index {
        case 0:
            emailStackView.isHidden = false
            phoneStackView.isHidden = true
        default:
            emailStackView.isHidden = true
            phoneStackView.isHidden = false
        }
    }
    
}
