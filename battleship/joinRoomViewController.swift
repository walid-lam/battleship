//
//  joinRoomViewController.swift
//  battleship
//
//  Created by Walid Lamrini on 25/12/2021.
//

import UIKit

class joinRoomViewController: UIViewController {
    var mSocket=SocketHandler.sharedInstance.getSocket();
//    @IBOutlet weak var joinID: UITextField!
//    @IBAction func joinbtn(_ sender: Any) {
//        mSocket.emit("join_room", [joinID.text])
//    }
    @IBOutlet weak var joinidd: UITextField!
    @IBAction func btnn(_ sender: Any) {
        mSocket.emit("join_room", [joinidd.text])
    }
    override func viewDidLoad() {
        SocketHandler.sharedInstance.establishedConnection();
        super.viewDidLoad()
        mSocket.on("sessionJoin"){ ( dataArray, ack ) -> Void in
            self.performSegue(withIdentifier: "gotoSession", sender: self)
                }
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
