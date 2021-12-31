//
//  ViewController.swift
//  battleship
//
//  Created by Walid Lamrini on 25/12/2021.
//

import UIKit

class ViewController: UIViewController {
    var mSocket=SocketHandler.sharedInstance.getSocket();
    
    var user: String!
    
    
    @IBOutlet weak var tesingLabel: UILabel!
    @IBAction func testButton(_ sender: Any) {
        mSocket.emit("testing")
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func createRoom(_ sender: Any) {
        mSocket.emit("create_room")
    }
    @IBAction func signbtn(_ sender: Any) {
        mSocket.emit("login", ["username": username.text, "password": password.text])
        mSocket.on("status"){ ( dataArray, ack ) -> Void in
            let dataReceived = dataArray[0] as! Int
            if(dataReceived == 200){
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
                SharedUsername.sharedInstance.usr=self.username.text
            }
            else if(dataReceived == 401){
                self.ShowUsernameAlert()
            }
            else if(dataReceived == 402){
                self.ShowPasswordAlert()
            }
            else{
                self.ShowServerAlert()
            }
            
        }
    }
    @IBAction func signupbtn(_ sender: Any) {
        mSocket.emit("register", ["username": username.text, "password": password.text])
        mSocket.on("status"){ ( dataArray, ack ) -> Void in
            let dataReceived = dataArray[0] as! Int
            if(dataReceived == 200){
                self.ShowSignUpAlert()
            }
            else if(dataReceived == 405){
                self.ShowSignUpErrorAlert()
            }
            else{
                self.ShowServerAlert()
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true 
        SocketHandler.sharedInstance.establishedConnection();
                
                
           
    }
    private func ShowPasswordAlert(){
        let alertController = UIAlertController(title: "Error", message: "Invalid Password", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }

    private func ShowUsernameAlert(){
        let alertController = UIAlertController(title: "Error", message: "Invalid Username", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func ShowServerAlert(){
        let alertController = UIAlertController(title: "Error", message: "There is a problem with the server. please try later.", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func ShowSignUpAlert(){
        let alertController = UIAlertController(title: "Sign Up", message: "Signed Up successfully. Please Login with your new credentials", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func ShowSignUpErrorAlert(){
        let alertController = UIAlertController(title: "Error", message: "Duplicated User. please provide a different Username", preferredStyle: .alert)
        let dismissAction = UIAlertAction.init(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
