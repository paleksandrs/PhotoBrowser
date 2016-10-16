//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit

class UITableViewMock: UITableView {

    var reloadDataCalled = false
   
    override func reloadData() {
        
        reloadDataCalled = true
    }

}
