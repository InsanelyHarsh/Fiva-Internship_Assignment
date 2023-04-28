//
//  NetworkingService.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 26/04/23.
//

import SwiftUI



public enum NetworkingError:Error,AlertsProtocol{
    case badURL
    case badResponse(response:String)
    case decodingFailed
    case unknownError
    
    case encodingFailed
    
    public var alertTitle:String{
        switch self {
        case .badURL:
            return "Bad URL"
        case .badResponse:
            return "Bad Response"
        case .decodingFailed:
            return "Decoding Failed"
        case .unknownError:
            return "Unknown Error"
        case .encodingFailed:
            return "Encoding Failed"
        }
    }
    
    public var alertDescription:String{
        switch self {
        case .badURL,.badResponse,.decodingFailed,.unknownError,.encodingFailed:
            return "Contact Developer"
        }
    }
}

public protocol Networking{
    func postJSON<E:Encodable, D:Decodable>(url urlString:String,requestData:E,responseType:D.Type)async throws->D
    func postJSONFormData<D:Decodable>(url urlString:String,requestData:[String:Any],responseType:D.Type)async throws->D
    func getJSON<T:Decodable>(url urlString:String,type:T.Type)async throws -> T
}



/*
 Task --> .yield()
 Priority of Tasks
 
 Child task inherentane from parent task
 -> .detached() { DO NOT USE! }
 -> Task Group
 -> Cancel Task (or) use .task{ } modifier, it handles cancelling for tasks
    -> Check cancellation
 -> async let -> Multiple async at once, waiting for all
 
 */



//Actors are basically classes but thread Safe
//Probaly OverKill in this situation
public final class NetworkingService{
    
    let networkingHelper:NetworkingHelperProtocol
    
    init(networkingHelper: NetworkingHelperProtocol = NetworkingHelper()) {
        self.networkingHelper = networkingHelper
    }
    
    ///POST REQUEST
    ///- INPUT --> URL,Data
    ///- OUTPUT --> Response
    public func postJSON<E:Encodable, D:Decodable>(url urlString:String,requestData:E,responseType:D.Type,headers:[String:String])async throws->D{
        do{
            //Request
            var request = try networkingHelper.makeRequest(url: urlString)
            request.httpMethod = "POST"
            
//            request.setValue("application/json", forHTTPHeaderField: "content-Type")
            request.setValue("application/json", forHTTPHeaderField: "accept")
            
            if(!headers.isEmpty){
                for (key,value) in headers{
                    request.setValue(value, forHTTPHeaderField: key)
                }
            }
            
            //Encoding
            request.httpBody = try networkingHelper.encodeData(requestData: requestData)
            
            
            //URL Session..
            let (data,response) = try await URLSession.shared.data(for: request)
            guard let res = response as? HTTPURLResponse else{
                throw NetworkingError.unknownError
            }
            
            if(!(200..<300).contains(res.statusCode)){
                Logger.logError("Bad Response: \(res.statusCode)")
                throw NetworkingError.badResponse(response: "\(res.statusCode)")
            }
            
            //Decoding Data
            let decodedData = try networkingHelper.decodeData(data: data, type: D.self)
            return decodedData
        }
        catch(_){
            throw NetworkingError.unknownError
        }
    }
    
    
    public func postJSONFormData<D:Decodable>(url urlString:String,requestData:[String:Any],responseType:D.Type,token:String = "")async throws->D{
        do{
            //Request
            var request = try networkingHelper.makeRequest(url: urlString)
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            if !token.isEmpty{
                request.setValue( "\(token)", forHTTPHeaderField: "Token")
            }
            
            let postString = networkingHelper.getPostString(params: requestData)
            request.httpBody = postString.data(using: .utf8)
            
            //URL Session..
            let (data,response) = try await URLSession.shared.data(for: request)
            guard let res = response as? HTTPURLResponse else{
                throw NetworkingError.unknownError
            }
            
            //Handling Response Code
            if(!(200..<300).contains(res.statusCode)){
                Logger.logError("Bad Response: \(res.statusCode)")
                throw NetworkingError.badResponse(response: "\(res.statusCode)")
            }
            
            //Decoding Data
            let decodedData = try networkingHelper.decodeData(data: data, type: D.self)
            return decodedData
        }
        catch(_){
            throw NetworkingError.unknownError
        }
    }
    
    public func getJSON<T:Decodable>(url urlString:String,type:T.Type,headers:[String:String])async throws -> T{
        
        do{
            var request = try networkingHelper.makeRequest(url: urlString)
            
            request.httpMethod = "GET"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            if(!authToken.isEmpty){
//                request.setValue(authToken, forHTTPHeaderField: "authToken")
//            }
            
            request.setValue("application/json", forHTTPHeaderField: "accept")
            
            if(!headers.isEmpty){
                for (key,value) in headers{
                    request.setValue(value, forHTTPHeaderField: key)
                }
            }
            
            let (data,response) = try await URLSession.shared.data(for: request)
            guard let res = response as? HTTPURLResponse else{
                throw NetworkingError.unknownError
            }
            
            //Handling Response Code
            if(!(200..<300).contains(res.statusCode)){
                Logger.logError("Bad Response: \(res.statusCode)")
                throw NetworkingError.badResponse(response: "\(res.statusCode)")
            }
            
            let decodedData = try networkingHelper.decodeData(data: data, type: T.self)
            return decodedData
        }
        
        catch(_){
            throw NetworkingError.unknownError
        }
    }
    
    
    
    ///**PUT REQUEST**
    ///- INPUT --> URL,Data
    ///- OUTPUT --> Response
    public func putJSON<E:Encodable, D:Decodable>(url urlString:String,requestData:E,responseType:D.Type,authToken:String = "")async throws->D{
        do{
            //Request
            var request = try networkingHelper.makeRequest(url: urlString)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "content-Type")
            
            if(!authToken.isEmpty){
                request.setValue(authToken, forHTTPHeaderField: "authToken")
            }
            
            //Encoding
            request.httpBody = try networkingHelper.encodeData(requestData: requestData)
            
            
            //URL Session..
            let (data,response) = try await URLSession.shared.data(for: request)
            guard let res = response as? HTTPURLResponse else{
                throw NetworkingError.unknownError
            }
            
            if(!(200..<300).contains(res.statusCode)){
                Logger.logError("Bad Response: \(res.statusCode)")
                throw NetworkingError.badResponse(response: "\(res.statusCode)")
            }
            
            //Decoding Data
            let decodedData = try networkingHelper.decodeData(data: data, type: D.self)
            return decodedData
        }
        catch(_){
            throw NetworkingError.unknownError
        }
    }
}

