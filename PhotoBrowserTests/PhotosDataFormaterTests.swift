//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class PhotosDataFormaterTests: XCTestCase {
    
    var photosDataFormater: PhotosDataFormater!
    var dateFormatter: NSDateFormatter!
    
    override func setUp() {
        super.setUp()
        
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        photosDataFormater = PhotosDataFormater()
    }
    
    func testPrepareDispalyDataReturnsCorrectPhotoDisplayData() {
        
        let mediaURL = NSURL(string: "http://test.com")!
       
        let photo = FakePhoto(mediaURL: mediaURL, title: "Test", dateTaken: dateFormatter.dateFromString("2016-09-05")!)
        
        let photoDisplayData = photosDataFormater.prepareDispalyData([photo])[0]
        
        XCTAssertTrue(photoDisplayData.mediaURL == mediaURL)
        XCTAssertTrue(photoDisplayData.title == "Test")
    }
    
    func testWhenDateTakenIsToday_PhotoDisplayDataDateTakenStringIsToday() {
        
        photosDataFormater.today = dateFormatter.dateFromString("2016-09-05")!
        
        let photo = FakePhoto(mediaURL: NSURL(string: "http://test.com")!, title: "Test", dateTaken: dateFormatter.dateFromString("2016-09-05")!)
        
        let photoDisplayData = photosDataFormater.prepareDispalyData([photo])[0]
        
        XCTAssertTrue(photoDisplayData.dateTaken == "Today")
    }
  
    func testWhenDateTakenIsYesterday_PhotoDisplayDataDateTakenStringIsYesterday() {
        
        photosDataFormater.today = dateFormatter.dateFromString("2016-09-05")!
        
        let photo = FakePhoto(mediaURL: NSURL(string: "http://test.com")!, title: "Test", dateTaken: dateFormatter.dateFromString("2016-09-04")!)
        
        let photoDisplayData = photosDataFormater.prepareDispalyData([photo])[0]
        
        XCTAssertTrue(photoDisplayData.dateTaken == "Yesterday")
    }
    
    func testWhenDateTakenIs2DaysAgo_PhotoDisplayDataDateTakenStringIs2DaysAgo() {
        
        photosDataFormater.today = dateFormatter.dateFromString("2016-09-05")!
        
        let photo = FakePhoto(mediaURL: NSURL(string: "http://test.com")!, title: "Test", dateTaken: dateFormatter.dateFromString("2016-09-03")!)
        
        let photoDisplayData = photosDataFormater.prepareDispalyData([photo])[0]
        
        XCTAssertTrue(photoDisplayData.dateTaken == "2 days ago")
    }
}
