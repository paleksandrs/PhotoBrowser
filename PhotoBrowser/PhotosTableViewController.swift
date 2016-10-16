//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import UIKit
import SDWebImage

class PhotosTableViewController: UITableViewController {

    var photosTableModel: PhotosTableModel!
    private var photos = [PhotoDisplayData]()
    var alertPresenter: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        photosTableModel.loadPhotos({ (photos) in
            self.updateTableWithPhotos(photos)
            }) { 
            self.displayError()
        }
    }
    
    private func setup(){
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }

    private func updateTableWithPhotos(photos: [PhotoDisplayData]) {
        
        self.photos = photos
        tableView.reloadData()
    }
    
    private func displayError() {
        
        let alert = UIAlertController(title: "Error", message: "Error loading data", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        alertPresenter?.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(PhotoTableViewCell.nameOfClass, forIndexPath: indexPath) as! PhotoTableViewCell
        
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title
        cell.dateLabel.text = photo.dateTaken
        cell.thumbnailView.sd_setImageWithURL(photo.mediaURL)
        
        return cell
    }
}
