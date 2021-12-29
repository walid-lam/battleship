//
//  GameViewController.swift
//  battleship
//
//  Created by Walid Lamrini on 25/12/2021.
//

import UIKit

class GameViewController: UIViewController {
    var mSocket=SocketHandler.sharedInstance.getSocket();
    @IBOutlet weak var bt1: UIButton!
    @IBOutlet weak var bt2: UIButton!
    @IBOutlet weak var bt3: UIButton!
    @IBOutlet weak var bt4: UIButton!
    @IBOutlet weak var bt5: UIButton!
    @IBOutlet weak var bt6: UIButton!
    @IBOutlet weak var bt7: UIButton!
    @IBOutlet weak var bt8: UIButton!
    @IBOutlet weak var bt9: UIButton!
    @IBOutlet weak var labeltest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketHandler.sharedInstance.establishedConnection();
        
        mSocket.on("gameCreated"){ ( dataArray, ack ) -> Void in
            let dataReceived = dataArray[0] as! Bool
//            self.labeltest.text = dataReceived
            self.bt1.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt2.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt3.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt4.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt5.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt6.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt7.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt8.setImage(UIImage(named: "blue.png"), for: .normal)
            self.bt9.setImage(UIImage(named: "blue.png"), for: .normal)
            if(dataReceived == true){
                return
            }
        }
        
    }
    
    
    var grid = [Int](repeating: 0, count: 9)
    
    @IBAction func btn1(_ sender: Any) {
        if(grid[0]==1){
            bt1.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[0]=0
        }
        else{
            bt1.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[0]=1;
        }
        
    }
    
    @IBAction func btn2(_ sender: Any) {
        if(grid[1]==1){
            bt2.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[1]=0
        }
        else{
            bt2.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[1]=1;
        }
    }
    
    @IBAction func btn3(_ sender: Any) {
        if(grid[2]==1){
            bt3.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[2]=0
        }
        else{
            bt3.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[2]=1;
        }
    }
    
    @IBAction func btn4(_ sender: Any) {
        if(grid[3]==1){
            bt4.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[3]=0
        }
        else{
            bt4.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[3]=1;
        }
    }
    
    @IBAction func btn5(_ sender: Any) {
        if(grid[4]==1){
            bt5.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[4]=0
        }
        else{
            bt5.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[4]=1;
        }
    }
    @IBAction func btn6(_ sender: Any) {
        if(grid[5]==1){
            bt6.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[5]=0
        }
        else{
            bt6.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[5]=1;
        }
    }
    
    @IBAction func btn7(_ sender: Any) {
        if(grid[6]==1){
            bt7.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[6]=0
        }
        else{
            bt7.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[6]=1;
        }
    }
    
    @IBAction func btn8(_ sender: Any) {
        if(grid[7]==1){
            bt8.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[7]=0
        }
        else{
            bt8.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[7]=1;
        }
    }
    @IBAction func btn9(_ sender: Any) {
        if(grid[8]==1){
            bt9.setImage(UIImage(named: "blue.png"), for: .normal)
            grid[8]=0
        }
        else{
            bt9.setImage(UIImage(named: "ship.png"), for: .normal)
            grid[8]=1;
        }
    }
    
    @IBAction func goBtn(_ sender: Any) {
        let string = grid.map {"\($0)"}.reduce("") { $0 + $1 }
        mSocket.emit("confirmBoard", string)
        
    }
    
}
