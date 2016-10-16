//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class FlickrAPITests: XCTestCase {

    var flickrAPI: FlickrAPI!
    var urlSession: NSURLSessionMock!
    var task: NSURLSessionDataTaskMock!
    
    override func setUp() {
        super.setUp()
        
        task = NSURLSessionDataTaskMock()
        urlSession = NSURLSessionMock()
        urlSession.task = task
       
        let factory = NSURLSessionFactoryMock()
        factory.session = urlSession
        
      
        flickrAPI = FlickrAPI(sessionFactory: factory)
    }
    
    func testLoadLatesPhotosWithSuccess_CallsDataTaskWithRequest() {
        
        flickrAPI.loadLatesPhotosWithSuccess({ (response) in }) { (error) in }
        
        XCTAssertNotNil(urlSession.dataRequest)
    }
    
    func testLoadLatesPhotosWithSuccess_CallsResumeOnDataTask() {
        
        flickrAPI.loadLatesPhotosWithSuccess({ (response) in }) { (error) in }
        
        XCTAssertTrue(task.resumeCalled)
    }

    func testWhenDataTaskWithRequestReturnsError_ErrorLoadingDataReturned() {
        
        var returnedError: PhotosAPIError?
        urlSession.error = NSError(domain: "", code: 0, userInfo: nil)
        urlSession.shouldComplete = true
        
        flickrAPI.loadLatesPhotosWithSuccess({ (response) in }) { (error) in
            returnedError = error
        }
        
        XCTAssertEqual(returnedError, .ErrorLoadingData)
    }
    
    func testWhenDataTaskWithRequestReturnsNilData_ErrorLoadingDataReturned() {
        
        var returnedError: PhotosAPIError?
        urlSession.data = nil
        urlSession.shouldComplete = true
        
        flickrAPI.loadLatesPhotosWithSuccess({ (response) in }) { (error) in
            returnedError = error
        }
        
        XCTAssertEqual(returnedError, .ErrorLoadingData)
    }
}
