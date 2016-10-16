//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {

    private let window: UIWindow
    private let photoListNavigationController: UINavigationController = UINavigationController()
    private let photoListCoordinator: Coordinator
    
    init(window: UIWindow, photosCoordinatorFactory: PhotosCoordinatorFactory = PhotosCoordinatorFactory()) {
        
        self.window = window
        photoListCoordinator = photosCoordinatorFactory.createCoordinatorWithNavigationController(photoListNavigationController)
    }
    
    func start() {
        
        window.rootViewController = photoListNavigationController
        photoListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
