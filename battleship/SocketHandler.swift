//
//  SocketHandler.swift
//  battleship
//
//  Created by Walid Lamrini on 25/12/2021.
//

import SocketIO
import Foundation

class SocketHandler: NSObject{
    static let sharedInstance = SocketHandler()
    let socket = SocketManager(socketURL: URL(string: "http://192.168.0.149:5000")!, config: [.log(true), .compress])
    var mSocket: SocketIOClient!
    
    override init() {
        super.init()
        mSocket = socket.defaultSocket
    }
    
    func getSocket()-> SocketIOClient{
        return mSocket
    }
    
    func establishedConnection() {
        mSocket.connect()
    }
     
     
    func closeConnection() {
        mSocket.disconnect()
    }

}
