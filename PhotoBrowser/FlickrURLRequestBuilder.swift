//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class FlickrURLRequestBuilder: NSObject {
    
    func buildRequestForLatestPhotos() -> NSURLRequest {
        
        let url = NSURL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&lang=en-us&nojsoncallback=1")!
        
        let request = NSURLRequest(URL: url)
        
        return request
    }
}
