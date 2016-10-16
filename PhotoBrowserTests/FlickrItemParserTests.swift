//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class FlickrItemParserTests: XCTestCase {

    var parser: FlickrItemParser!
    
    override func setUp() {
        super.setUp()
        
        parser = FlickrItemParser()
    }
    
    func testWhenParsePhotoFromJSON_InvalidJson_PhotosAPIErrorThrown() {
        
        var dict = Json()
        dict["test"] = "test"
        
        var apiError: PhotosAPIError?
        
        do {
            _ = try parser.parsePhotoFromJSON(dict)
        }catch {
            apiError = error as? PhotosAPIError
        }
        
        XCTAssertNotNil(apiError)
    }
    
    func testWhenParsePhotoFromJSON_ValidJson_FlickrPhotoResponseReturned() {
        
        let photoURL = "https://farm9.staticflickr.com/8225/29265499574_74e1fb1943_m.jpg"
        let photoTitle = "title"
        let dateTaken =  "2016-09-18T13:35:44-08:00"
        
        var media = Json()
        media["m"] = photoURL
        
        var dict = Json()
        dict["title"] = photoTitle
        dict["media"] = media
        dict["date_taken"] = dateTaken
        
        let date = stringToDate(dateTaken)
        
        var photo: FlickrPhoto?
        do { photo = try parser.parsePhotoFromJSON(dict) }catch {}
        
        XCTAssertEqual(photo!.title, photoTitle)
        XCTAssertEqual(photo!.mediaURL.absoluteString, photoURL)
        date
        XCTAssertTrue (date.compare(photo!.dateTaken) == NSComparisonResult.OrderedSame)
    }
    
    private func stringToDate(string: String) -> NSDate {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.dateFromString(string)!
    }
}
