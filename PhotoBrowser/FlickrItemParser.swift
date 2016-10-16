//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

class FlickrItemParser {
    
    private let jsonKeyTitle = "title"
    private let jsonKeyMedia = "media"
    private let jsonKeyDateTaken = "date_taken"
    
    func parsePhotoFromJSON(json: Json) throws -> FlickrPhoto {
        
        guard let media = json[jsonKeyMedia] as? Json,
            let imageUrlString = media["m"] as? String,
            let mediaURL = NSURL(string: imageUrlString),
            let title = json[jsonKeyTitle] as? String
        else {
            throw PhotosAPIError.ErrorParsingData
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let str = json[jsonKeyDateTaken] as! String
        let dateTaken = dateFormatter.dateFromString(str)!
        
        return FlickrPhoto(mediaURL: mediaURL, title: title, dateTaken: dateTaken)
    }
}
