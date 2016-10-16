//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class NSURLSessionMock: NSURLSession {

    var dataRequest: NSURLRequest?
    var task = NSURLSessionDataTaskMock()
    var error: NSError?
    var data: NSData?
    var shouldComplete = false
    
    override func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        
        dataRequest = request
        
        if shouldComplete {
            completionHandler(data, nil, error)
        }
        
        return task
    }
}
