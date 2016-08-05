//
//  DetailViewController.swift
//  Lover
//
//  Created by Fly on 7/27/16.
//  Copyright © 2016 Fly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var loverId:Int!
    var loverName:String!
    var loverCons:String!
    var loverImageName:String!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var consLbl: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(DetailViewController.edit))
        
        let notiName = Notification.Name("updateData")
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.getUpdateNoti(noti:)), name: notiName, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = loverName {
            nameLbl.text = name
            self.title = name
        }
        
        if let cons = loverCons {
            consLbl.text = cons
        }
        
        if let imageName = loverImageName {
            photoImage.image = UIImage(named: imageName)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! EditViewController
        destination.loverId = loverId
        destination.loverName = loverName
        destination.loverCons = loverCons
        destination.loverImageName = loverImageName
    }
    
    func edit(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "editSegue", sender: nil)
//        let editVC = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
//        editVC.loverName = loverName
//        editVC.loverCons = loverCons
//        editVC.loverImageName = loverImageName
//        
//        self.present(editVC, animated: true, completion: nil)
    }
    
    func getUpdateNoti(noti:Notification) {
        
        let newLoverName = noti.userInfo!["loverName"] as! String
        let newLoverCons = noti.userInfo!["loverCons"] as! String
        let newLoverImageName = noti.userInfo!["loverImageName"] as! String
        
        self.loverName = newLoverName
        self.loverCons = newLoverCons
        self.loverImageName = newLoverImageName
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
