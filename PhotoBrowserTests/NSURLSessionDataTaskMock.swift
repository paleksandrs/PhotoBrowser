//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class NSURLSessionDataTaskMock: NSURLSessionDataTask {

    var resumeCalled = false
    
    override func resume() {
        
        resumeCalled = true
    }
}
