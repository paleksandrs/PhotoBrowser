//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

typealias SuccessCallback = (photos: [PhotoDisplayData]) -> Void
typealias ErrorCallback = () -> Void

class PhotosTableModel {
    
    let photosAPI: PhotosAPI
    let formater: PhotosDisplayDataFormater
    var dispatcher = Dispatcher()
    
    init(photosAPI: PhotosAPI, formater: PhotosDisplayDataFormater =  PhotosDataFormater()) {
        
        self.photosAPI = photosAPI
        self.formater = formater
    }
    
    func loadPhotos(successCallback: SuccessCallback, errorCallback: ErrorCallback) {
        
        photosAPI.loadLatesPhotosWithSuccess({ (response) in
            
            let displayData = self.formater.prepareDispalyData(response.photos)
            
           self.dispatcher.dispatchAsyncOnMainQueue({ 
                successCallback(photos: displayData)
           })
            
        }) { (error) in
            errorCallback()
        }
    }
}
