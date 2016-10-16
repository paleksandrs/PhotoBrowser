//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//
import Foundation

protocol PhotosDisplayDataFormater {
    
    func prepareDispalyData(photos: [Photo]) -> [PhotoDisplayData]
}

protocol PhotoDisplayData {
    
    var mediaURL: NSURL {get}
    var title: String {get}
    var dateTaken: String {get}
}

func ==(lhs: PhotoDisplayData, rhs: PhotoDisplayData) -> Bool {
    return lhs.title == rhs.title && lhs.dateTaken == rhs.dateTaken && lhs.mediaURL.absoluteString == rhs.mediaURL.absoluteString
}