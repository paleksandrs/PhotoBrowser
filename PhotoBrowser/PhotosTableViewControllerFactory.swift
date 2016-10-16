//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class PhotosTableViewControllerFactory {
    
    private lazy var storyboard: UIStoryboard = {
        
        return UIStoryboard(name: "PhotosList", bundle: NSBundle.mainBundle())
    }()
    
    func createPhotosTableViewController() -> PhotosTableViewController {
    
        return storyboard.instantiateViewControllerWithIdentifier(PhotosTableViewController.nameOfClass) as! PhotosTableViewController
    }
    
  
}
