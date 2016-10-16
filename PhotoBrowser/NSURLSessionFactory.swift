//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

class NSURLSessionFactory: NSObject {

    func createSession() -> NSURLSession {
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }
}
