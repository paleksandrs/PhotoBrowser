//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit
@testable import PhotoBrowser

class DispatcherMock: Dispatcher {

    override func dispatchAsyncOnMainQueue(block: dispatch_block_t) {
        block()
    }
}
