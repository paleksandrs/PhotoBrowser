//
//  Copyright © 2016 Aleksandrs Proskurins. All rights reserved.
//

import Foundation

typealias Json = [String: AnyObject]

class FlickrAPI: PhotosAPI {
    
    private let session: NSURLSession
    private let requestBuilder = FlickrURLRequestBuilder()
    
    init(sessionFactory: NSURLSessionFactory = NSURLSessionFactory()) {
        
        session = sessionFactory.createSession()
    }
    
    func loadLatesPhotosWithSuccess(successCallback: APISuccessCallback, errorCallback: APIErrorCallback) {
        
        let request = requestBuilder.buildRequestForLatestPhotos()
    
        let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            
            guard error == nil, let jsonData = data else {
                errorCallback(error: PhotosAPIError.ErrorLoadingData)
                return
            }
            
            do {
                let response = try self.createResponseFromData(jsonData)
                successCallback(response: response)
            }catch {
                errorCallback(error: PhotosAPIError.ErrorParsingData)
            }
        });
        
        task.resume()
    }
    
    private func createResponseFromData(data: NSData) throws -> PhotosAPIResponse {
        
        let parser = FlickrResponseParser()
        
        let fixedJSONData = fixJSONData(data)
        
        do {
            let json = try serializeResponse(fixedJSONData)
            
            let response = try parser.parseResponseFromJSON(json)
            return response
        }
        catch {throw error} 
    }
    
    private func serializeResponse(data: NSData) throws -> Json {
        
        var json =  Json()
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! Json
        }catch {
            throw error
        }
        
        return json
    }
    
    private func fixJSONData(data: NSData) -> NSData {
        
        var dataString = NSString(data:  data, encoding: NSUTF8StringEncoding)!
        dataString = dataString.stringByReplacingOccurrencesOfString("\\'", withString: "'")
        
        return dataString.dataUsingEncoding(NSUTF8StringEncoding)!
    }
}
