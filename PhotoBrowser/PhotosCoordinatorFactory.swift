//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class PhotosCoordinatorFactory {

    func createCoordinatorWithNavigationController(nc: UINavigationController) -> Coordinator {
        
         return PhotosCoordinator(navigationController: nc)
    }
}
