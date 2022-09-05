//
//  DetaliCommentsVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 5.09.22.
//

import UIKit

class DetaliCommentsVC: UIViewController {
    var comment: Comment?
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var email: UILabel!
    
    
    @IBOutlet weak var body: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func setupUI() {
        name.text = comment?.name
        email.text = comment?.email
        body.text = comment?.body
    }
}
