//
//  ViewController.swift
//  battleship
//
//  Created by Walid Lamrini on 25/12/2021.
//

import UIKit

class ViewController: UIViewController {
    var mSocket=SocketHandler.sharedInstance.getSocket();
  
    @IBOutlet weak var label: UILabel!
    
    @IBAction func btact(_ sender: Any) {
            mSocket.emit("counter")
        }
        
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func createRoom(_ sender: Any) {
        mSocket.emit("create_room")
    }
    @IBAction func signbtn(_ sender: Any) {
        mSocket.emit("login", ["username": username.text, "password": password.text])
    }
    @IBAction func signupbtn(_ sender: Any) {
        mSocket.emit("register", ["username": username.text, "password": password.text])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SocketHandler.sharedInstance.establishedConnection();
                
                mSocket.on("status"){ ( dataArray, ack ) -> Void in
                    let dataReceived = dataArray[0] as! Int
                    if(dataReceived == 200){
                        self.performSegue(withIdentifier: "LoginSegue", sender: self)
                    }
                }
        

        
               
    }

//    @IBAction func ShowPopUp(_ sender: Any) {
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
//        self.addChild(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
//
//
//    }
    
}
