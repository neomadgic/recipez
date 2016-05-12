//
//  ViewController.swift
//  recipez
//
//  Created by Vu Dang on 2/22/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//
// REMEMBER TO GIVE CREDIT TO ICON54 FROM NOUNPROJECT FOR ICON USE

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool)
    {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults()
    {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext;
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do
            {
                let results = try context.executeFetchRequest(fetchRequest)
                self.recipes = results as! [Recipe]
            }
        catch let err as NSError
            {
                print(err.debugDescription)
            }
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell
            {
                let recipe = recipes[indexPath.row]
                cell.configureCell(recipe)
                return cell
            }
        else
            {
                return RecipeCell()
            }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("goToRecipe", sender: recipes[indexPath.row])
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "goToRecipe"
        {
            if let recipeViewC = segue.destinationViewController as? RecipeVC
            {
                if let theRecipe = sender as? Recipe
                {
                    recipeViewC.recipeName = theRecipe.title!
                    recipeViewC.recipeSteps = theRecipe.steps!
                    recipeViewC.recipeIngred = theRecipe.ingredients!
                    recipeViewC.recipeImage = theRecipe.image!
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let fetchRequest = NSFetchRequest()
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            fetchRequest.entity = entity
            do
            {
                let result = try context.executeFetchRequest(fetchRequest)
                let recipe = result[indexPath.row]
                context.deleteObject(recipe as! NSManagedObject)
                
            }
            catch
            {
                let fetchError = error as NSError
                print(fetchError)
            }
            do
            {
                try context.save()
            }
            catch
            {
                let saveError = error as NSError
                print(saveError)
            }

            recipes.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    

}

