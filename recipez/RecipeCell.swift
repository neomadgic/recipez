//
//  RecipeCell.swift
//  recipez
//
//  Created by Vu Dang on 2/23/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell
{
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configureCell(recipe: Recipe)
    {
        recipeTitle.text = recipe.title
        recipeImg.image = recipe.getRecipeImg()
    }

}
