//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class PhotosTableViewControllerFactoryTests: XCTestCase {
    
    
    func testFactoryReturnInstanceOfPhotosTableViewController() {
        
        let factory = PhotosTableViewControllerFactory()
        let viewController = factory.createPhotosTableViewController()
        
        XCTAssertTrue(viewController.isMemberOfClass(PhotosTableViewController))
    }
}
