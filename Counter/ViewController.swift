//
//  ViewController.swift
//  test
//
//  Created by Иван Иван on 19.06.2024.
//

import UIKit



class ViewController: UIViewController {
    var counter:Int = 0
    
    func getCurrentDateTime () -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let timeZoneAbbreviation = TimeZone.abbreviationDictionary["MSK"] {
            dateFormatter.timeZone = TimeZone(abbreviation: timeZoneAbbreviation)
        }
        dateFormatter.dateFormat = "dd/MM/YYYY HH:mm:ss"
        let currentDateInFormat = dateFormatter.string(from: currentDate)
        return currentDateInFormat
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "История изменений:"
        textView.clipsToBounds = true;
        textView.layer.cornerRadius = 10;
        labelCounter.text = "0"
        
    }
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        if counter - 1 >= 0 {
            let currentDateTime = getCurrentDateTime()
            counter -= 1
            labelCounter.text = counter.codingKey.stringValue
            print("The minus button was pressed. Current counter: \(counter)")
            textView.text += "\n[\(currentDateTime)]: значение изменено на -1"
        } else {
            let currentDateTime = getCurrentDateTime()
            textView.text += "\n[\(currentDateTime)]: попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBOutlet weak var labelCounter: UILabel!
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func buttonRefreshDidTap(_ sender: Any) {
        counter = 0
        labelCounter.text = counter.codingKey.stringValue
        let currentDateTime = getCurrentDateTime()
        print("The refresh button was pressed. Current counter: \(counter)")
        textView.text += "\n[\(currentDateTime)]: значение изменено на 0"
    }
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        counter += 1
        labelCounter.text = counter.codingKey.stringValue
        let currentDateTime = getCurrentDateTime()
        print("The plus button was pressed. Current counter: \(counter)")
        textView.text += "\n[\(currentDateTime)]: значение изменено на +1"
    }
    
}

