//
//  DetaliUserVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 3.09.22.
//

import UIKit

class DetaliUserVC: UIViewController {

    var user: User?
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var webSite: UILabel!
    
    
    @IBOutlet weak var street: UILabel!
    
    @IBOutlet weak var suite: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var zipCod: UILabel!
    
    @IBOutlet weak var Latitude: UILabel!
    
    @IBOutlet weak var Longitude: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()
    }
    
    @IBAction func postsAction() {
        let storyboard = UIStoryboard(name: "PostsAndComments", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PostsTVC") as! PostsTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func albomsAction() {
    }
    
    @IBAction func todosAction() {
    }
    
    
    
    
    private func setupUI() {
        name.text = user?.name
        userName.text = user?.username
        email.text = user?.email
        phone.text = user?.phone
        webSite.text = user?.website
        street.text = user?.address?.street
        suite.text = user?.address?.suite
        city.text = user?.address?.city
        zipCod.text = user?.address?.zipcode
        Latitude.text = user?.address?.geo?.lat
        Longitude.text = user?.address?.geo?.lng
    }



}
