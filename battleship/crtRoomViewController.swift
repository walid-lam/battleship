//
//  crtRoomViewController.swift
//  battleship
//
//  Created by Walid Lamrini on 25/12/2021.
//

import UIKit

class crtRoomViewController: UIViewController {
    var mSocket=SocketHandler.sharedInstance.getSocket();
    @IBOutlet weak var roomId: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SocketHandler.sharedInstance.establishedConnection();
        
        mSocket.on("room_id"){ ( dataArray, ack ) -> Void in
                    let dataReceived = dataArray[0] as! Int
                    self.roomId.text = "\(dataReceived)"
                }
        mSocket.on("session"){ ( dataArray, ack ) -> Void in
            self.performSegue(withIdentifier: "crtSession", sender: self)
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
