//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation
@testable import PhotoBrowser

class CoordinatorMock: Coordinator {

    var startWasCalled = false
    
    func start() {
        
        startWasCalled = true
    }
}
