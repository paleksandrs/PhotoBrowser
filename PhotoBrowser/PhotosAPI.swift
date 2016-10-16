//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

enum PhotosAPIError: ErrorType {
    case ErrorLoadingData
    case ErrorParsingData
}

typealias APISuccessCallback = (response: PhotosAPIResponse) -> Void
typealias APIErrorCallback = (error: PhotosAPIError) -> Void

protocol PhotosAPI {
    
    func loadLatesPhotosWithSuccess(successCallback: APISuccessCallback, errorCallback: APIErrorCallback)
}