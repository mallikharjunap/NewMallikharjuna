//
//  ViewController.swift
//  Mallikharjun
//
//  Created by Apple on 11/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mallikharjuna: UILabel!
    var qualification:String = ""
    var someobj:Someobject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        someobj = Someobject()
        
//        let roomNumber = 56 // Replace with the room number you want to check
//
//        let flrNumber = calculateCurrentFloor(roomNumber: roomNumber)
//
//        if flrNumber != -1 {
//            print("Room \(roomNumber) is on Floor \(flrNumber)")
//        } else {
//            print("Invalid room number")
//        }
//
        
        let roomNumber = 55
        let floorNumber = findFloorNumber(for: roomNumber)
        print("The room \(roomNumber) is on floor \(floorNumber).")
        
        getDate()
        
        
    }
    
    
    func getDate(){
        
        ApiServers.shared.getFetchDate(apiString: "") { results in
            
            switch results {
                
            case .success(let posts):
                for post in posts {
                    
                    print("Title :\(post.title)\n Body : \(post.body)")
                }
            case .failure(let error):
               print(error)
            }
            
            
            
        }
        
        
    }
    deinit{
       
        print("viewController deinitalized")
    }
    
  
    
    func calculateCurrentFloor(roomNumber: Int) -> Int {
        if roomNumber > 0 {
            var presntFlr = 1
            var pendingRooms = roomNumber
            
            while pendingRooms > 0 {
                let roomsOnCurrentFloor = presntFlr % 2 == 1 ? 10 : 5
                let value = presntFlr % 2 == 1
                print(value)
                
                
                print(roomsOnCurrentFloor)
                if pendingRooms <= roomsOnCurrentFloor {
                    print(presntFlr)
                    return presntFlr
                } else {
                    pendingRooms -= roomsOnCurrentFloor
                    presntFlr += 1
                }
            }
        }
        
        // Invalid room number
        return -1
        
        
}
    
    func findFloorNumber(for roomNumber: Int) -> Int {
        let roomsPerFirstFloor = 10
        let roomsPerAlternateFloor = 5
        
        if roomNumber <= roomsPerFirstFloor {
            return (roomNumber - 1) / roomsPerFirstFloor + 1
        } else {
            let additionalRooms = roomNumber - roomsPerFirstFloor
            let alternateFloors = (additionalRooms - 1) / roomsPerAlternateFloor + 1
            return  alternateFloors
        }
    }
    
    
}

class Someobject {
    
    init() {
        print("Someobject initalized")
    }
    
    deinit {
        print("SomeObject Deinitalized")
    }
}



