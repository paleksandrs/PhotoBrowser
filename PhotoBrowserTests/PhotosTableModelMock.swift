//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit
@testable import PhotoBrowser

class PhotosTableModelMock: PhotosTableModel {

    var loadPhotosCalled = false
    var loadPhotosShouldSucceed = true
    var photos = [PhotoDisplayData]()
    
    override func loadPhotos(successCallback: SuccessCallback, errorCallback: ErrorCallback) {
        
        loadPhotosCalled = true
        if loadPhotosShouldSucceed {
            
            successCallback(photos: photos)
        }else{
            
            errorCallback()
        }
    }
}
