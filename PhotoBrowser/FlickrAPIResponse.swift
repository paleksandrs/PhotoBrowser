//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

struct FlickrAPIResponse: PhotosAPIResponse {
    
    let photos: [Photo]
    
    init (photos: [Photo]) {
    
        self.photos = photos
    }
}