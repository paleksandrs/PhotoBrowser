//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class PhotosCoordinator: Coordinator {

    let navigationController: UINavigationController
    let photosListViewController: PhotosTableViewController
    
    init(navigationController: UINavigationController){
        
        self.navigationController  = navigationController
        
        photosListViewController = PhotosTableViewControllerFactory().createPhotosTableViewController()
        photosListViewController.alertPresenter = photosListViewController
        photosListViewController.photosTableModel = PhotosTableModel(photosAPI: FlickrAPI())
    }
    
    func start()  {
        
        navigationController.pushViewController(photosListViewController, animated: true)
    }
}
