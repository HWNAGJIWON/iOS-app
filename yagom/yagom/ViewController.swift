//
//  ViewController.swift
//  yagom
//
//  Created by 황지원 on 2021/09/24.
//

import UIKit

class ViewController: UIViewController {

    var randomValue:Int = 0
    var tryCount:Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLable: UILabel!
    @IBOutlet weak var sliderValueLable: UILabel!
    
    @IBOutlet weak var mininumValueLable: UILabel!
    @IBOutlet weak var maximumValueLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slider.setThumbImage(UIImage(named: "slider_thumb"), for: .normal)
        reset()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider){
//        print(slider.value)
        sliderValueLable.text = String(Int(slider.value))
    }

    
    func showAlert(message: String)
    {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    @IBAction func touchUpHitButton(_ sender: UIButton){
//        print("hit")
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLable.text = "\(tryCount) / 5 "
        if Int(slider.value) == randomValue
        {
            print("YOU WIN!")
            showAlert(message: " 오 좀 하네? ")
            reset()
        }
        else if tryCount > 5
        {
            print("YOU lose")
            showAlert(message: " 바보 멍청이 ~ 이걸 틀리네 ㅋ ")
            reset()
        }
        else if hitValue < randomValue
        {
            mininumValueLable.text = "\(hitValue)"
            slider.minimumValue = Float(hitValue)
        }
        else
        {
            maximumValueLable.text = "\(hitValue)"
            slider.maximumValue = Float(hitValue)
        }
       
        
        
        
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
       reset()
    }
    
    func reset()
    {
        print("reset")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLable.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        mininumValueLable.text = "0"
        maximumValueLable.text = "30"
        sliderValueLable.text = "15"
    }
}


