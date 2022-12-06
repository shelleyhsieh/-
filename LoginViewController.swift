//
//  LoginViewController.swift
//  宮崎駿角色配對
//
//  Created by shelley on 2022/12/4.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame:CGRect(x: 0, y: 0, width: 390, height: 844))
        backgroundImage.image = UIImage(named: "吉卜力")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        loginButton.setTitle("開始測驗囉！", for:.normal )
        loginButton.titleLabel?.font = UIFont(name: "ChenYuluoyan", size: 40)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.tintColor = UIColor(red: 150/255, green: 84/255, blue: 84/255, alpha: 0.8)
        loginButton.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 234/255, alpha: 1)
        
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
