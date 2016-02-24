//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Vu Dang on 2/24/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import UIKit

class CreateRecipeVC: UIViewController
{
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var createRecipeBtn: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
