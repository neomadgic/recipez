//
//  CreateRecipeVC.swift
//  recipez
//
//  Created by Vu Dang on 2/24/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import UIKit
import CoreData

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
    
    @IBAction func createRecipePressed(sender: AnyObject!)
    {
        if let title = recipeTitle.text where title != ""
            {
                let app = UIApplication.sharedApplication().delegate as! AppDelegate
                let context = app.managedObjectContext
                let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
                let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
                recipe.title = title
                recipe.ingredients = recipeIngredients.text
                recipe.steps = recipeSteps.text
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
            }
    }
    
    @IBAction func addIngredPressed(sender: AnyObject)
    {
        
    }
    
    @IBAction func addStepPressed(sender: AnyObject)
    {
        
    }
    
}
