//
//  ViewController.swift
//  LoginApp
//
//  Created by Firuza on 30.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var forgotUsername: UIButton!
    
    
    @IBOutlet weak var forgotPassword: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotUsername{
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else if sender == forgotPassword{
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else {
            segue.destination.navigationItem.title = usernameTextField.text
        }
    }
    
    @IBAction func forgotUsernameBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotUsername)
    }
    
    
    @IBAction func forgotPasswordBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotPassword)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

