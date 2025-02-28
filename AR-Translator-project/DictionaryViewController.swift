//
//  DictionaryViewController.swift
//  AR-Translator-project
//
//  Created by Kantachat Puagkajee on 11/08/2020.
//  Copyright © 2020 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate  {
    //MARK: Outlets
    @IBOutlet weak var inputTextLabel: UITextField!
    @IBOutlet weak var outputTextLabel: UITextView!
    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var languagePickerHeighConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectLanguageButton: UIButton!
    @IBOutlet weak var translateButton: UIButton!
    
      //MARK: Translation variables
      let languages = ["Select Language", "Hindi","Thai","Korean", "French", "Italian", "German", "Japanese"]
      let languageCodes = ["th", "hi","th","ko", "fr", "it", "de", "ja"]
      var targetCode = "ja"
      var tempInputText = "nil"
      let translateButtonIcon = UIImage(named: "translate_iMG")
    
    var pickerVisible: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // languagePicker.reloadAllComponents()
        configureLanguagePicker()
        inputTextLabel.delegate = self
        translateButton.setImage(translateButtonIcon, for: .normal)
        
    }
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
      }
      
      // MARK: - Configuration
      func configureLanguagePicker() {
          languagePicker.dataSource = self
          languagePicker.delegate = self
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Actions
    @IBAction func selectLanguageTapped(_ sender: Any) {
        if pickerVisible {
                  languagePickerHeighConstraint.constant = 0
                  pickerVisible = false
              } else {
                  languagePickerHeighConstraint.constant = 200
                  pickerVisible = true
              }
              
              UIView.animate(withDuration: 0.3) {
                  self.view.layoutSubviews()
                  self.view.updateConstraints()
              }
    }
    
    
    @IBAction func translateButtonTapped(_ sender: Any) {
        translateText(detectedText: self.tempInputText)
        
    }
    
    //MARK: Delegetes
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.tempInputText = inputTextLabel.text ?? "Hello"
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
      textField.resignFirstResponder()
        return true
    }
    
   
    
} //End Main Brackets
extension DictionaryViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    
    //MARK: UIPicker Delegates
       
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return languages.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return languages[row]
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           selectLanguageButton.setTitle(languages[row], for: .normal)
           targetCode = languageCodes[row]
            languagePickerHeighConstraint.constant = 0
            pickerVisible = false
       
       }
    
    //Translation calls
    func translateText(detectedText: String) {
        
        guard !detectedText.isEmpty else {
            return
        }
        
        let task = try? GoogleTranslate.sharedInstance.translateTextTask(text: detectedText, targetLanguage: self.targetCode, completionHandler: { (translatedText: String?, error: Error?) in
            debugPrint(error?.localizedDescription)
            
            DispatchQueue.main.async {
                self.outputTextLabel.text = translatedText
            }
            
        })
        task?.resume()
    }
}


