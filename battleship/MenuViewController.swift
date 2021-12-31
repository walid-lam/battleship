//
//  MenuViewController.swift
//  battleship
//
//  Created by Walid Lamrini on 31/12/2021.
//

import UIKit

class MenuViewController: UIViewController {
   
    
    @IBOutlet weak var user: UILabel!
    var mSocket=SocketHandler.sharedInstance.getSocket();
    
    @IBAction func createRoom(_ sender: Any) {
        mSocket.emit("create_room")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketHandler.sharedInstance.establishedConnection();
        user.text=SharedUsername.sharedInstance.usr
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
