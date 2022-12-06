//
//  resultViewController.swift
//  宮崎駿角色配對
//
//  Created by shelley on 2022/12/6.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var ghibliImageView: SharpImageView!
    @IBOutlet weak var introLable: UILabel!
   
    var resultInfo: ResultInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        backgroundImageView.image = UIImage(named: "背景圖")
        backgroundImageView.contentMode = .scaleAspectFit
        view.insertSubview(backgroundImageView, at: 0)
        resultView.backgroundColor = UIColor(red: 204/255, green: 205/255, blue: 207/255, alpha: 1)
        resultView.transform = CGAffineTransform(rotationAngle: -.pi / 75)
        updateUI()
    }
    
    func updateUI(){
        resultLable.textAlignment = .center
        resultLable.font = UIFont(name: "jf-openhuninn-1.1", size: 36)
        nameLable.font = UIFont(name: "jf-openhuninn-1.1", size: 24)
        
        if let resultInfo = resultInfo {
            nameLable.text = resultInfo.name
            resultLable.text = resultInfo.resultName
            
            ghibliImageView.image = UIImage(named: resultInfo.pic)
            introLable.text = resultInfo.intro
            
        }
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
