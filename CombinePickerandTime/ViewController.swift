//
//  ViewController.swift
//  CombinePickerandTime
//
//  Created by Greeens5 on 15/05/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var pickerlabel: UILabel!

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    var pickervalue : [String] = [String]()
    var pickervalue2 : [String] = [String]()
    var picker1String = NSString()
    var picker2String = NSString()
    var dateString = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datepicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        pickervalue = ["pasupathi","nanthan","dillip","aravind","murali"]
        pickervalue2 = ["good","very good","great","excelent","well done"]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickervalue.count
        }else{
            return pickervalue2.count
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if component == 0{
            return pickervalue[row]
        }else{
            return pickervalue2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if component == 0{
            picker1String = pickervalue[row] as NSString
            pickerlabel.text = "\(picker1String) \(picker2String) \(dateString)"
         
        }else{
            picker2String = pickervalue2[row] as NSString
            pickerlabel.text = "\(picker1String) \(picker2String) \(dateString)"
       
        }
    }
    
    @objc func datePickerValueChanged (datePicker: UIDatePicker) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-MM-yyyy hh:mm a"
        let datevalue = dateformatter.string(from: datePicker.date)
        dateString = datevalue as NSString
        pickerlabel.text = "\(picker1String) \(picker2String) \(dateString)"
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
