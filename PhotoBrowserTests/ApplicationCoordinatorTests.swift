//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import XCTest
@testable import PhotoBrowser

class ApplicationCoordinatorTests: XCTestCase {
    
    var window: UIWindowMock!
    var coordinatorFacotry: PhotosCoordinatorFactoryMock!
    var coorindator: Coordinator!
    
    override func setUp() {
        super.setUp()
        
        window = UIWindowMock()
        coordinatorFacotry = PhotosCoordinatorFactoryMock()
        coorindator = ApplicationCoordinator(window: window, photosCoordinatorFactory: coordinatorFacotry)
    }
    
    func testWhenApplicationCoorinatorStarted_RootViewControllerIsUINavigationController() {
        
        coorindator.start()
        
        XCTAssertTrue(window.rootViewController!.isMemberOfClass(UINavigationController))
    }
    
    func testWhenApplicationCoorinatorStarted_MakeKeyAndVisibleCalled() {
        
        coorindator.start()
        
        XCTAssertTrue(window.makeKeyAndVisibleCalled)
    }
    
    func testWhenApplicationCoorinatorStarted_PhotoListCoordinatorStarted() {
        
        coorindator.start()
        
        XCTAssertTrue(coordinatorFacotry.coortinator.startWasCalled)
    }
}

class PhotosCoordinatorFactoryMock: PhotosCoordinatorFactory {
    
    var coortinator = CoordinatorMock()
    
    override func createCoordinatorWithNavigationController(nc: UINavigationController) -> Coordinator {
        
        return coortinator
    }
}


