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
    @IBOutlet weak var stepsLbl: UILabel!
    @IBOutlet weak var ingredLbl: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
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
        nameLbl.text = recipeName
        stepsLbl.text = recipeSteps
        ingredLbl.text = recipeIngred
        recipeImg.image = UIImage(data: recipeImage)
        
    }

}
