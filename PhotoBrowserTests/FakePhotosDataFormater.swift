//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation
@testable import PhotoBrowser

class FakePhotosDataFormater: PhotosDisplayDataFormater {
    
    var photosArray = [PhotoDisplayData]()
    
    func prepareDispalyData(photos: [Photo]) -> [PhotoDisplayData] {
        
        return photosArray
    }

}

struct FakePhotoData: PhotoDisplayData {
    
    let mediaURL: NSURL
    let title: String
    let dateTaken: String
    
    init(mediaURL: NSURL, title: String, dateTaken: String) {
        
        self.mediaURL = mediaURL
        self.title = title
        self.dateTaken = dateTaken
    }
}