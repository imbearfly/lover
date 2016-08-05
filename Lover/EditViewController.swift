//
//  EditViewController.swift
//  Lover
//
//  Created by Fly on 7/27/16.
//  Copyright © 2016 Fly. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UINavigationControllerDelegate {

    var loverId:Int!
    var loverName:String!
    var loverCons:String!
    var loverImageName:String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var consTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(EditViewController.updateData(_:)))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateData(_ sender: AnyObject) {
        let notiName = Notification.Name("updateData")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: ["loverId": self.loverId, "loverName":self.nameTxt.text!, "loverCons":self.consTxt.text!, "loverImageName":loverImageName])
        navigationController?.popViewController(animated: true)
        print("AAAAAA")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = loverName {
            nameTxt.text = name
            self.title = name
        }
        
        if let cons = loverCons {
            consTxt.text = cons
        }
        
        if let imageName = loverImageName {
            imageView.image = UIImage(named: imageName)
        }

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
