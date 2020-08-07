//
//  HomeViewController.swift
//  AR-Translator-project
//
//  Created by Kantachat Puagkajee on 07/08/2020.
//  Copyright © 2020 Kantachat Puagkajee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //set Background image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "yellowBackgroundIMG")!)
        //set Bar button item appearance
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
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
