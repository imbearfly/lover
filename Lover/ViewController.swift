//
//  ViewController.swift
//  Lover
//
//  Created by Fly on 7/27/16.
//  Copyright © 2016 Fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lover1: UIButton!
    @IBOutlet weak var lover2: UIButton!
    @IBOutlet weak var lover3: UIButton!

    var loverA = lover(id: 0, name: "Gal Gadot", constellation: "Taurus", photoName: "Gal")
    var loverB = lover(id: 1, name: "Scarlett Johansson", constellation: "Sagittarius", photoName: "Scarlett")
    var loverC = lover(id: 2, name: "Margot Robbie", constellation: "Cancer", photoName: "Margot")
    
    
    class lover {
        var id:Int!
        var name:String!
        var constellation:String!
        var photoName:String!
        
        
        init(id:Int, name:String, constellation:String, photoName:String) {
            self.id = id
            self.name = name
            self.constellation = constellation
            self.photoName = photoName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notiName = Notification.Name("updateData")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getUpdateNoti(noti:)), name: notiName, object: nil)

        lover1.setTitle(loverA.name, for: UIControlState.normal)
        lover2.setTitle(loverB.name, for: UIControlState.normal)
        lover3.setTitle(loverC.name, for: UIControlState.normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destination = segue.destinationViewController as! DetailViewController
        if segue.identifier == "lover1Segue" {
            destination.loverId = loverA.id
            destination.loverName = loverA.name
            destination.loverCons = loverA.constellation
            destination.loverImageName = loverA.photoName
        }
        if segue.identifier == "lover2Segue" {
            destination.loverId = loverB.id
            destination.loverName = loverB.name
            destination.loverCons = loverB.constellation
            destination.loverImageName = loverB.photoName
        }
        if segue.identifier == "lover3Segue" {
            destination.loverId = loverC.id
            destination.loverName = loverC.name
            destination.loverCons = loverC.constellation
            destination.loverImageName = loverC.photoName
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func lover1Act(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "lover1Segue", sender: nil)
    }
    
    @IBAction func lover2Act(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "lover2Segue", sender: nil)
    }
    
    @IBAction func lover3Act(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "lover3Segue", sender: nil)
    }
    
    func getUpdateNoti(noti: Notification) {
        
        let loverId = noti.userInfo!["loverId"] as! Int
        let newLoverName = noti.userInfo!["loverName"] as! String
        let newLoverCons = noti.userInfo!["loverCons"] as! String
        let newLoverImageName = noti.userInfo!["loverImageName"] as! String
        
        switch loverId {
        case 0:
            loverA.name = newLoverName
            loverA.constellation = newLoverCons
            loverA.photoName = newLoverImageName
            lover1.setTitle(loverA.name, for: UIControlState.normal)
        case 1:
            loverB.name = newLoverName
            loverB.constellation = newLoverCons
            loverB.photoName = newLoverImageName
            lover2.setTitle(loverB.name, for: UIControlState.normal)
        case 2:
            loverC.name = newLoverName
            loverC.constellation = newLoverCons
            loverC.photoName = newLoverImageName
            lover3.setTitle(loverC.name, for: UIControlState.normal)
        default:
            loverA.id = 0
            loverB.id = 1
            loverC.id = 2
        }

        }

    }



