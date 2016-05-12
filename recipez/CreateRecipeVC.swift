//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Vu Dang on 2/24/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
{
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var createRecipeBtn: UIButton!
    @IBOutlet weak var ingredAddBtn: MaterialButton!
    @IBOutlet weak var stepAddBtn: MaterialButton!
    
   
    var stepNum = 1
    var fullIngredStr = ""
    var fullStepStr = ""
    var imagePicker: UIImagePickerController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController();
        imagePicker.delegate = self;
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true;
        recipeIngredients.returnKeyType = UIReturnKeyType.Next

        self.recipeIngredients.delegate = self
        self.recipeSteps.delegate = self
        
        recipeIngredients.tag = 100
        recipeSteps.tag = 101
        
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
    
    @IBAction func createRecipePressed(sender: AnyObject!)
    {
        if let title = recipeTitle.text where title != ""
            {
                let app = UIApplication.sharedApplication().delegate as! AppDelegate
                let context = app.managedObjectContext
                let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
                let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
                recipe.title = title
                recipe.ingredients = fullIngredStr
                recipe.steps = fullStepStr
                recipe.setRecipeImage(recipeImg.image!)
                
                context.insertObject(recipe)
                do
                    {
                        try context.save()
                    }
                catch
                    {
                        print("Could not save recipe")
                    }
                
                self.navigationController?.popViewControllerAnimated(true)
                stepNum = 1
            }
    }
    
    @IBAction func addIngredPressed(sender: AnyObject)
    {
        if recipeIngredients.text != ""
        {
            if fullIngredStr == ""
                {
                    fullIngredStr = fullIngredStr.stringByAppendingString(recipeIngredients.text!)
                    recipeIngredients.text = ""
                }
            else
                {
                    fullIngredStr = fullIngredStr.stringByAppendingString("\n").stringByAppendingString(recipeIngredients.text!)
                    recipeIngredients.text = ""
                }

        }
        
    }
    
    @IBAction func addStepPressed(sender: AnyObject)
    {
        if recipeSteps.text != "" && stepNum == 1
            {
                fullStepStr = fullStepStr.stringByAppendingString("\(stepNum). ").stringByAppendingString(recipeSteps.text!)
                recipeSteps.text = ""
                stepNum = stepNum + 1
            }
        if recipeSteps.text != "" && stepNum > 1
            {
                fullStepStr = fullStepStr.stringByAppendingString("\n").stringByAppendingString("\(stepNum). ").stringByAppendingString(recipeSteps.text!)
                recipeSteps.text = ""
                stepNum = stepNum + 1
            }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField.tag == 100
            {
                recipeIngredients.resignFirstResponder()
                addIngredPressed(ingredAddBtn)
            }
        if textField.tag == 101
            {
                recipeSteps.resignFirstResponder()
                addStepPressed(stepAddBtn)
            }

        self.view.endEditing(true)
        return true
    }
    
    
}
