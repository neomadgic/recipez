//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Vu Dang on 2/24/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import UIKit

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var createRecipeBtn: UIButton!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true;
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImg.image = image;
    }
    
    @IBAction func addImgPressed(sender: AnyObject)
    {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipePressed(sender: AnyObject)
    {
        
    }
    
}
