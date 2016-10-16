//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

class Dispatcher: NSObject {

    func dispatchAsyncOnMainQueue(block: dispatch_block_t) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
}
