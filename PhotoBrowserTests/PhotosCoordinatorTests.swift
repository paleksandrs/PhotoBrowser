//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class PhotosCoordinatorTests: XCTestCase {
    
    var coorindator: PhotosCoordinator!
    var navigationController: UINavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        
        navigationController = UINavigationControllerMock()

        coorindator = PhotosCoordinator(navigationController: navigationController)
    }
    
    func testWhenPhtosCoortinatorInitilised_PhotosListViewControllerIsSetupCorrectly() {
        
        XCTAssertTrue(coorindator.photosListViewController.alertPresenter == coorindator.photosListViewController)
        
          XCTAssertNotNil(coorindator.photosListViewController.photosTableModel)
    }
    
    
    func testWhenPhtosCoortinatorStarted_PhotosTableViewControllerIsPushed() {
        
        coorindator.start()
        XCTAssertTrue(navigationController.pushedViewController!.isMemberOfClass(PhotosTableViewController))
    }
    
  
    
}
