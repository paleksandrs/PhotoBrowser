//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation
@testable import PhotoBrowser

class FakePhotosAPI: PhotosAPI {
    
    var loadLatesPhotosCalled = false
    var response: FakePhotosAPIResponse?
    var error: PhotosAPIError?
    
    func loadLatesPhotosWithSuccess(successCallback: APISuccessCallback, errorCallback: APIErrorCallback) {
        
        loadLatesPhotosCalled = true
        
        if let _ = response {
            successCallback(response: response!)
        }
        
        if let _ = error {
            errorCallback(error: error!)
        }
    }
}

struct FakePhotosAPIResponse: PhotosAPIResponse {
    
    let photos: [Photo]
    
    init (photos: [Photo]) {
        
        self.photos = photos
    }
}

