//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class UIWindowMock: UIWindow {

    var makeKeyAndVisibleCalled = false
    
    override func makeKeyAndVisible() {
       
        makeKeyAndVisibleCalled = true
    }
}
