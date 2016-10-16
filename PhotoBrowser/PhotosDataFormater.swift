//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

class PhotosDataFormater: PhotosDisplayDataFormater {
    
    var today = NSDate()
    
    func prepareDispalyData(photos: [Photo]) -> [PhotoDisplayData] {
        
        var displayPhotos = [PhotoDisplayData]()
    
        for photo in photos {
            
            let photoDisplayData = PhotoData(mediaURL: photo.mediaURL, title: photo.title, dateTaken: displayDateFromDate(photo.dateTaken))
            displayPhotos.append(photoDisplayData)
        }
        
        return displayPhotos
    }
    
    private func displayDateFromDate(date: NSDate) ->String {
        
        let daysAgo = date.numberOfDaysUntilDateTime(today, inTimeZone: NSTimeZone.systemTimeZone())
        
        if daysAgo <= 0 {
            return "Today"
        }else if (daysAgo == 1) {
            return "Yesterday"
        }else{
            return String(daysAgo) + " days ago"
        }
    }
}
