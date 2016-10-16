//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//
import Foundation
@testable import PhotoBrowser

struct FakePhoto: Photo {
    
    let mediaURL: NSURL
    let title: String
    let dateTaken: NSDate
    
    init(mediaURL: NSURL, title: String, dateTaken: NSDate){
        
        self.mediaURL = mediaURL
        self.title =  title
        self.dateTaken = dateTaken
    }
}