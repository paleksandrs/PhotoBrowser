//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class PhotosTableViewControllerTests: XCTestCase {
    
    var viewController: PhotosTableViewController!
    var photosTableModelMock: PhotosTableModelMock!
    
    override func setUp() {
        super.setUp()
        
        photosTableModelMock = PhotosTableModelMock(photosAPI: FlickrAPI())
        
        let factory = PhotosTableViewControllerFactory()
        viewController = factory.createPhotosTableViewController()
        viewController.photosTableModel = photosTableModelMock
        _ = viewController.view
    }
    
    func testOnViewDidLoad_LoadPhotosCalled() {
        
        viewController.viewDidLoad()
        
        XCTAssertTrue(photosTableModelMock.loadPhotosCalled)
    }
    
    func testWhenLoadPhotosCalled_WithSuccess_TableViewIsReloaded() {
        
        let tableMock = UITableViewMock()
        viewController.tableView = tableMock
        
        viewController.viewDidLoad()
        
        XCTAssertTrue(tableMock.reloadDataCalled)
    }
    
    func testWhenLoadPhotosCalled_WithError_AlertIsDisplayed() {
    
        photosTableModelMock.loadPhotosShouldSucceed = false
        
        let alertPresenter = UIViewControllerMock()
        viewController.alertPresenter = alertPresenter
        viewController.viewDidLoad()

        XCTAssertTrue(alertPresenter.presentedViewControllert!.isMemberOfClass(UIAlertController))
    }
    
    func testNumberOfSectionsInTableViewIsOne() {
        
        let count = viewController.numberOfSectionsInTableView(viewController.tableView)
        XCTAssertEqual(count, 1)
    }
    
    func testWhenLoadPhotosCalled_WithSuccess_NumberOfRowsInSectionIsEqualToPhotosCount() {
        
        let photo = PhotoData(mediaURL: NSURL(string: "test")!, title: "test", dateTaken: "test")
        photosTableModelMock.photos = [photo]
        
        viewController.viewDidLoad()
        
        let count = viewController.tableView(viewController.tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(count, photosTableModelMock.photos.count)
    }
    
    func testWhenCellForRowAtIndexPath_CellConfiguredWithPhotosFromPhotosArray(){
        
        let photo = PhotoData(mediaURL: NSURL(string: "test")!, title: "test", dateTaken: "test")
        photosTableModelMock.photos = [photo]
        
        viewController.viewDidLoad()
        
        let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 1)) as! PhotoTableViewCell

        XCTAssertEqual(cell.titleLabel.text, photo.title)
        XCTAssertEqual(cell.dateLabel.text, photo.dateTaken)
    }
    
}
