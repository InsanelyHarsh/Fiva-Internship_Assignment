//
//  NetworkingHelper.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import Foundation


public protocol NetworkingHelperProtocol{
    func makeRequest(url urlString:String)throws ->URLRequest
    func decodeData<T:Decodable>(data:Data,type:T.Type)throws->T
    func encodeData<E:Encodable>(requestData:E)throws->Data
    func getPostString(params:[String:Any]) -> String
}

class NetworkingHelper:NetworkingHelperProtocol{

    
    public func makeRequest(url urlString:String)throws ->URLRequest {
        guard let url = URL(string: urlString)
        else {
            Logger.logError("Invalid URL")
            throw NetworkingError.badURL
        }
        
        return URLRequest(url: url)
    }
    
    public func encodeData<E:Encodable>(requestData:E)throws->Data{
        let encoder = JSONEncoder()
        do{
            let encodedData = try encoder.encode(requestData)
            return encodedData
        }
        catch{
            throw NetworkingError.encodingFailed
        }
    }
    
    public func decodeData<T:Decodable>(data:Data,type:T.Type)throws->T{
        let decoder = JSONDecoder()
        do{
            
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }
        catch{
            Logger.logError("Decoding Failed")
            throw NetworkingError.decodingFailed
        }
    }
    
    public func getPostString(params:[String:Any]) -> String{
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}
