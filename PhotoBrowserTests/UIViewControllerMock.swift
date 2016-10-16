//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class UIViewControllerMock: UIViewController {
    
    var presentedViewControllert: UIViewController?
    
    override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        presentedViewControllert = viewControllerToPresent
    }
}
