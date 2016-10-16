//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit
@testable import PhotoBrowser

class NSURLSessionFactoryMock: NSURLSessionFactory {
    
    var session: NSURLSession?

    override func createSession() -> NSURLSession {
        
        if let _ = session {
            
            return session!
        }else{
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            return NSURLSession(configuration: config)
        }
    }
}


