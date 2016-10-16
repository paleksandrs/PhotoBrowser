//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class UINavigationControllerMock: UINavigationController {

    var pushedViewController: UIViewController?
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        pushedViewController = viewController
    }
}
