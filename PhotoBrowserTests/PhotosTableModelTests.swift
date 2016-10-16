//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class PhotosTableModelTests: XCTestCase {
    
    var model: PhotosTableModel!
    var fakeAPI: FakePhotosAPI!
    var fakeFormater: FakePhotosDataFormater!
        
    override func setUp() {
        super.setUp()
        
        fakeAPI = FakePhotosAPI()
        fakeFormater = FakePhotosDataFormater()
        
        model = PhotosTableModel(photosAPI: fakeAPI, formater: fakeFormater)
        model.dispatcher =  DispatcherMock()
    }

    func testWhenLoadPhotos_LoadLatesPhotosWithSuccessIsCalled() {
        
        model.loadPhotos({ (photos) in }) {}
        
        XCTAssertTrue(fakeAPI.loadLatesPhotosCalled)
    }
    
    func testWhenLoadPhotos_Success_SuccessCallbackCalled() {
        
        var successCallbackCalled = false
        fakeAPI.response = createFakeResponse()
        
        model.loadPhotos({ (photos) in
            successCallbackCalled = true
        }) {}
        
        XCTAssertTrue(successCallbackCalled)
    }
    
    func testWhenLoadPhotos_Fails_ErrorCallbackCalled() {
        
        var errorCallbackCalled = false
        fakeAPI.error = .ErrorLoadingData
        
        model.loadPhotos({ (photos) in }) {
            
            errorCallbackCalled = true
        }
        
        XCTAssertTrue(errorCallbackCalled)
    }
    
    func testWhenLoadPhotos_Success_SuccessCallbackCalledWithDataFromFormater() {
        
        fakeAPI.response = createFakeResponse()
        
        let fakePhoto = FakePhotoData(mediaURL: NSURL(string: "test")!, title: "title", dateTaken: "11/12/2016")
        
        fakeFormater.photosArray = [fakePhoto]
        
        
        var returnedPhotos = [PhotoDisplayData]()
        model.loadPhotos({ (photos) in
            returnedPhotos = photos
        }) {}
        
        XCTAssertEqual(returnedPhotos.count, 1)
        XCTAssertTrue(fakePhoto == returnedPhotos[0])
    }
    
    func createFakeResponse() -> FakePhotosAPIResponse {
        
        let photo = FakePhoto(mediaURL: NSURL(string: "test")!, title: "title", dateTaken: NSDate())
        
        return FakePhotosAPIResponse(photos: [photo])
    }
    
}



