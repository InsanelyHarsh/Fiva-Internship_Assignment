//
//  CacheHandler.swift
//  Fiva-Internship_Assignment
//
//  Created by Harsh Yadav on 28/04/23.
//

import Foundation


class CacheHandler{
    typealias cacheType = NSCache<NSString,NSData>
    
    static let Instance = CacheHandler()
    
    private init(){ }
    
    private lazy var cache:cacheType = {
        let cache = cacheType()
        cache.countLimit = 100
        cache.totalCostLimit = 100*255*255
        return cache
    }()
    
    func getObject(forKey key:NSString)->Data?{
        cache.object(forKey: key) as? Data
    }
    
    func set(object:NSData, forKey key:NSString){
        cache.setObject(object, forKey: key)
    }
}
