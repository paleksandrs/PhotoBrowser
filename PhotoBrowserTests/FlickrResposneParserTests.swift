//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class FlickrResposneParserTests: XCTestCase {
    
    var parser: FlickrResponseParser!
    
    override func setUp() {
        super.setUp()
       
        parser = FlickrResponseParser()
    }
    
    func testWhenParseResponseFromJSON_InvalidJson_PhotosAPIErrorThrown() {
        
        var dict = Json()
        dict["test"] = "test"
        
        var apiError: PhotosAPIError?
        
        do {
            _ = try parser.parseResponseFromJSON(dict)
        }catch {
            apiError = error as? PhotosAPIError
        }
        
        XCTAssertNotNil(apiError)
    }
    
    func testWhenParseResponseFromJSON_ValidJson_FlickrResponseReturned() {
        
        let json = createValidJson()
        var response: PhotosAPIResponse?
        
        do {
            response = try parser.parseResponseFromJSON(json)
        }catch {}
        
        XCTAssertEqual(response!.photos.count, 1)
    }
    
    
    func createValidJson() -> Json {
 
        var media = Json()
        media["m"] = "https://farm9.staticflickr.com/8225/29265499574_74e1fb1943_m.jpg"
        
        var item = Json()
        item["title"] = "title"
        item["media"] = media
        item["date_taken"] = "2016-09-18T13:35:44-08:00"
        
        var json = Json()
        
        json["items"] = [item]
        
        return json
    }
}
