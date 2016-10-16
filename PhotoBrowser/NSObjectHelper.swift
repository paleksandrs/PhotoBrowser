//
//  Copyright © 2015 John Lewis. All rights reserved.
//

import Foundation

public extension NSObject {
    
    public class var nameOfClass: String{
        
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
}