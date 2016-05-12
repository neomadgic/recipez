//
//  RecipeVC.swift
//  recipez
//
//  Created by Vu Dang on 5/7/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController
{

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ingredLbl: UITextView!
    @IBOutlet weak var stepsLbl: UITextView!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var nameView: MaterialView!
    
    var recipeName = ""
    var recipeSteps = ""
    var recipeIngred = ""
    var recipeImage: NSData!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool)
    {

        nameView.alpha = 0.5
        nameLbl.text = recipeName
        nameLbl.sizeToFit()
        nameLbl.alpha = 1.0
        stepsLbl.text = recipeSteps
        ingredLbl.text = recipeIngred
        recipeImg.image = UIImage(data: recipeImage)
        ingredLbl.scrollEnabled = true
        stepsLbl.scrollEnabled = true
        
        ingredLbl.scrollRangeToVisible(NSMakeRange(0, 0))
        stepsLbl.scrollRangeToVisible(NSMakeRange(0, 1))
        
    }

}
