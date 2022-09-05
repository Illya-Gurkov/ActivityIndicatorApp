//
//  DetaliCommentsVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 5.09.22.
//

import UIKit

class DetaliCommentsVC: UIViewController {
    var comment: Comment?
    @IBOutlet var name: UILabel!
    
    @IBOutlet var email: UILabel!
    
    @IBOutlet var body: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        name.text = comment?.name
        email.text = comment?.email
        body.text = comment?.body
    }
}
