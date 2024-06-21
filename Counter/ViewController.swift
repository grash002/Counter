//
//  ViewController.swift
//  test
//
//  Created by Иван Иван on 19.06.2024.
//

import UIKit



class ViewController: UIViewController {
    var counter:Int = 0
    
    func curr_dt () -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let timeZoneAbbreviation = TimeZone.abbreviationDictionary["MSK"] {
            dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        }
        dateFormatter.dateFormat = "dd/MM/YYYY HH:mm:ss"
        let dt = dateFormatter.string(from: date)
        return dt
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "История изменений:"
        textView.clipsToBounds = true;
        textView.layer.cornerRadius = 10;
        labelCounter.text = "0"
        
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        if counter - 1 >= 0 {
            let dt = curr_dt()
            counter -= 1
            labelCounter.text = counter.codingKey.stringValue
            print("The minus button was pressed. Current counter: \(counter)")
            textView.text += "\n[\(dt)]: значение изменено на -1"
        } else {
            let dt = Date()
            textView.text += "\n[\(dt)]: попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBOutlet weak var labelCounter: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func buttonRefresh(_ sender: Any) {
        counter = 0
        labelCounter.text = counter.codingKey.stringValue
        let dt = curr_dt()
        print("The refresh button was pressed. Current counter: \(counter)")
        textView.text += "\n[\(dt)]: значение изменено на 0"
    }
    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        labelCounter.text = counter.codingKey.stringValue
        let dt = curr_dt()
        print("The plus button was pressed. Current counter: \(counter)")
        textView.text += "\n[\(dt)]: значение изменено на +1"
    }
    
}

