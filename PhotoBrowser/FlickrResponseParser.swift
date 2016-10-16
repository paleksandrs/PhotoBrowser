//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

class FlickrResponseParser {
    
    private let jsonKeyItems = "items"
    private let itemParser: FlickrItemParser
    
    init(itemParser: FlickrItemParser = FlickrItemParser()) {
        
        self.itemParser = itemParser
    }
    
    func parseResponseFromJSON(json: Json) throws -> PhotosAPIResponse {
        
        guard let itemsJson = json[jsonKeyItems] as? [[String: AnyObject]]
        else {
            throw PhotosAPIError.ErrorParsingData
        }
        
        var photos = [Photo]()
        for itemJson in itemsJson {
            do {
                let photo = try itemParser.parsePhotoFromJSON(itemJson)
                photos.append(photo)
            }catch {
                throw error
            }
        }
        return FlickrAPIResponse(photos: photos)
    }

}
