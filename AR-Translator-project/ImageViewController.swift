//
//  ImageViewController.swift
//  AR-Translator-project
//
//  Created by Kantachat Puagkajee on 07/08/2020.
//  Copyright © 2020 Kantachat Puagkajee. All rights reserved.
//

import UIKit


class ImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARKS: Outlets
    @IBOutlet weak var detectTextLabel: UITextView!
    @IBOutlet weak var translateTextLabel: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: Translation variables
    let languages = ["Select Language", "Hindi", "French", "Italian", "German", "Japanese"]
    let languageCodes = ["hi", "hi", "fr", "it", "de", "ja"]
    var targetCode = "ja"
    
    //MARK: Texts recognition
    
    
    //MARK: Delegates
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
              //Dismiss the picker controller
              dismiss(animated: true, completion: nil)
              
              //guard unwrap the image picked
              guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                  fatalError("Couldn't load image!")
              }
              
              //Set the selected-image to display
              imageView.image = selectedImage
           
           
              //Translating process
              //detectText(image: selectedImage)
                     
                     
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
              //set Background image
              self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blueBackgroundIMG")!)
              //set Navigation bar color
              navigationController?.navigationBar.barTintColor = UIColor.gray
              navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
              // Do any additional setup after loading the view.
              
              self.detectTextLabel.layer.cornerRadius = 10
              self.translateTextLabel.layer.cornerRadius = 10
    }
    
    
    //MARK: Actions
    @IBAction func photoButtonTapped(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                       let alert = UIAlertController(title: "No photos", message: "This device does not support photos.", preferredStyle: .alert)
                       let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       alert.addAction(ok)
                       self.present(alert, animated: true, completion: nil)
                       return
                   }
                
                   let picker = UIImagePickerController()
                picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
                   picker.sourceType = .photoLibrary
                   present(picker, animated: true, completion: nil)
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
