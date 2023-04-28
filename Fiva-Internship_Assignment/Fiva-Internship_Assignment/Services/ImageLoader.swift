//
//  ImageLoader.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import UIKit

public final class ImageLoader{
    
    let networkingHelper:NetworkingHelperProtocol
    
    init(networkingHelper: NetworkingHelperProtocol) {
        self.networkingHelper = networkingHelper
    }
    
    public func fetchImage(url urlString:String,headers:[String:String] = [:])async throws -> UIImage?{
        do{
            let request = try networkingHelper.makeRequest(url: urlString)
            
//            request.httpMethod = "GET"
//            request.setValue("application/json", forHTTPHeaderField: "accept")
            
//            if(!headers.isEmpty){
//                for (key,value) in headers{
//                    request.setValue(value, forHTTPHeaderField: key)
//                }
//            }
            
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard let res = response as? HTTPURLResponse else{
                throw NetworkingError.unknownError
            }
            
            //Handling Response Code
            if(!(200..<300).contains(res.statusCode)){
                Logger.logError("Bad Response: \(res.statusCode)")
                throw NetworkingError.badResponse(response: "\(res.statusCode)")
            }
            
            return UIImage(data: data)
        }
        
        catch(_){
            throw NetworkingError.unknownError
        }
    }
}
