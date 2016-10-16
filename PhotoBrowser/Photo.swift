//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

protocol Photo {
    
    var mediaURL: NSURL {get}
    var title: String {get}
    var dateTaken: NSDate {get}
}