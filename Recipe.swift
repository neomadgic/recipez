//
//  Recipe.swift
//  recipez
//
//  Created by Vu Dang on 2/23/16.
//  Copyright © 2016 Vu Dang. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Recipe: NSManagedObject
{

    func setRecipeImage(img: UIImage)
    {
        let data = UIImagePNGRepresentation(img)
        self.image = data;
    }
    
    func getRecipeImg() -> UIImage?
    {
        let img = UIImage(data: self.image!)
        return img
    }

}
