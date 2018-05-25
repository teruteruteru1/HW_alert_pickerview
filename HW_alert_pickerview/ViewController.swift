//
//  ViewController.swift
//  HW_alert_pickerview
//
//  Created by Yasuteru on 2018/05/25.
//  Copyright © 2018年 Yasuteru. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource
{

    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myTextfield: UITextView!
    
    var movieLists = ["Avengers: Infinity War","DEAD POOL2","Jurassic World: Fallen Kingdom","Quiet Place","The Greatest Showman","Kingsman: The Golden Circle","Justice League"]
    
    var thoughts = ["次回作はよぉぉぉぉ！！","いろいろ汚いけど面白かった！","まだ始まってねーよ！","怖っわ...","いまのとこ今年1番！サントラ買おうぜ！！","安定の面白さ！","ワンダーウーマンめっちゃ強くね？って思ってたら、スーパーマンの方が強かったwww   バットマンは... otz...."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }
    @IBAction func buttonmovie(_ sender: UIButton) {
        myPickerView.isHidden = false
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return movieLists.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return movieLists[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let alertmessage = UIAlertController(title: "よし！", message: movieLists[row] + "を見よう！", preferredStyle: .alert)
        
        alertmessage.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OK!")}))
        
        present(alertmessage, animated: true, completion: {()->Void in
            self.myTextfield.text = self.thoughts[row]
            self.myPickerView.isHidden = true
            self.myTextfield.isHidden = false
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

