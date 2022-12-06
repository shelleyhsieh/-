//
//  GhibliViewController.swift
//  宮崎駿角色配對
//
//  Created by shelley on 2022/12/4.
//

import UIKit

class GhibliViewController: UIViewController {

    @IBOutlet weak var classicImageView: UIImageView!
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sexSegmentControl: UISegmentedControl!
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    @IBOutlet weak var braveSwitch: UISwitch!
    @IBOutlet weak var smartSwitch: UISwitch!
    @IBOutlet weak var confidenceSlider: UISlider!
    @IBOutlet weak var confidenceLable: UILabel!
    
    @IBOutlet weak var cancleBtn: UIButton!
    @IBOutlet weak var finishBtn: UIButton!
    
    var braveArray = ["小梅(草壁梅)","魔法公主(小桑)","貓巴士","霍爾","蘇菲","龍貓"]
    var smartArray = ["荻野千尋","白龍","阿席達卡","荒野女巫","無臉男"]
    var resultName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupGradientBackground()
        reset()
    }
//    switch與配對資料及圖片顯示

    
    @IBSegueAction func showResultView(_ coder: NSCoder) -> resultViewController? {
        let name = String(nameTextField.text!)
        let personalityArray = braveArray + smartArray
        var show: String = ""
        
        if name == "" {
            let alert = UIAlertController(title: "填個名字吧！", message: "暱稱就可以囉～", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
        if braveSwitch.isOn == true , smartSwitch.isOn == true {
            show = personalityArray.randomElement()!
            print("全開")
        }else if braveSwitch.isOn == true , smartSwitch.isOn == false{
            show = braveArray.randomElement()!
            print("一開")
        }else if braveSwitch.isOn == false , smartSwitch.isOn == true{
            show = smartArray.randomElement()!
            print("二開")
        }else if braveSwitch.isOn == false, smartSwitch.isOn == false {
            let alert = UIAlertController(title: "少了一個步驟！", message: "個性按鈕請擇一", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            print("全關")
        }
    
        let controller = resultViewController(coder: coder)
        controller?.resultInfo = ResultInfo(name: name, resultName: "\(show)", pic: "\(show)", intro: "")
        return controller
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        reset()
    }
//    return鍵收鍵盤，event選primary action trigger
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
//    拉slider時，同時數字跟著變動
    @IBAction func sliderChange(_ sender: UISlider) {
        let confidenceScore = Int(sender.value)
        confidenceSlider.maximumValue = Float(10)
        confidenceLable.text = "\(confidenceScore)"
    }
    
//    清除還原預設值，圖片、暱稱、性別、switch、slider、測驗結果字串
    func reset(){
//        nameLable.text = "OOO"
//        resultView.isHidden = true
//        resultLable.text = ""
        questionLable.text = "你是宮崎駿筆下的哪一位人物呢？"
        questionLable.font = UIFont(name: "jf-openhuninn-1.1", size: 20)
        questionLable.textAlignment = .center
        nameTextField.text = ""
        sexSegmentControl.selectedSegmentIndex = 0
        classicImageView.image = UIImage(named: "經典")
        braveSwitch.isOn = false
        smartSwitch.isOn = false
        confidenceSlider.value = 0
        confidenceLable.text = "10"
        
    }
//    配對資料
//    func pairing(){
//        let resultName = nameTextField.text!
//        nameLable.text = "\(resultName)"
//        if nameLable.text != nil {
//
//        }else{
//
//        }
//        resultView.isHidden = false
//        resultLable.text = ""
//        let personalityArray = braveArray + smartArray
////    全開
//        if braveSwitch.isOn == true , smartSwitch.isOn == true {
//            let show = personalityArray.randomElement()!
//            ghibliImageView.image = UIImage(named: show)
//            resultLable.text = "\(show)"
//            print("全開")
////    開第一個
//        }else if braveSwitch.isOn == true , smartSwitch.isOn == false{
//            let show = braveArray.randomElement()!
//            ghibliImageView.image = UIImage(named: show)
//            resultLable.text = "\(show)"
//            print("開第一個brave")
////    開第二個
//        }else if braveSwitch.isOn == false , smartSwitch.isOn == true{
//            let show = smartArray.randomElement()!
//            ghibliImageView.image = UIImage(named: show)
//            resultLable.text = "\(show)"
//            print("開第二個按鈕")
//        }
//    }
    func setupButton(){
        cancleBtn.titleLabel?.font = UIFont(name: "jf-openhuninn", size: 20)
        cancleBtn.backgroundColor = UIColor(red: 240/255, green: 235/255, blue: 229/255, alpha: 1)
        cancleBtn.tintColor = .brown
//        cancleBtn.layer.borderWidth = 5
//        cancleBtn.layer.borderColor = UIColor(red: 199/255, green: 184/255, blue: 161/255, alpha: 1).cgColor
        cancleBtn.layer.cornerRadius = 15
        
        finishBtn.titleLabel?.font = UIFont(name: "jf-openhuninn", size: 20)
        finishBtn.backgroundColor = UIColor(red: 240/255, green: 235/255, blue: 229/255, alpha: 1)
        finishBtn.tintColor = .brown
        finishBtn.layer.cornerRadius = 15
    }
    
    func setupGradientBackground(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 216/255, green: 202/255, blue: 175/255, alpha: 1).cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
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
//extension GhibliViewController: UITextViewDelegate{
////    按鍵盤上的return鍵可收起鍵盤
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
////    textField.resignFirstResponder() 要求離開我們的Responder
//        return true
//    }
//
//}
