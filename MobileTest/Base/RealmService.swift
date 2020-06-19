//
//  RealmService.swift
//  MobileTest
//
//  Created by macbook on 3/29/1399 AP.
//  Copyright © 1399 Yahya. All rights reserved.
//

import Foundation

import RealmSwift


class RealmService {
    private var   realm:Realm

    static let shared = RealmService()
    private init() {
        realm = try! Realm()
     }
    func getDataFromDB<T:Object>(type:T) ->   Results<T> {
        let results =   realm.objects(T.self)
        return results
       }
    func create<T : Object>(_ object : T , completion : @escaping(Error?) -> Void) {
        do {
            try realm.write {
                realm.add(object, update: .all)
                completion(nil)
            }
        } catch {
            completion(error)
        }
    }
    
    
    func update<T : Object>(_ object : T , with dictionary : [String:Any?] , completion : @escaping(Error?) -> Void) {
        do {
            try realm.write {
                for (key,value) in dictionary {
                    object.setValue(value, forKey: key)
                }
                completion(nil)
            }
        } catch {
            completion(error)
        }
    }
    
    func delete<T : Object>(_ object : T, completion : @escaping(Error?) -> Void) {
        do {
            try realm.write {
                realm.delete(object)
                completion(nil)
            }
        } catch {
            completion(error)
        }
    }
    
    func deleteAll(completion : @escaping(Error?) -> Void) {
        do {
            try realm.write {
                realm.deleteAll()
                completion(nil)
            }
        } catch {
            completion(error)
        }
    }
}


enum AddResponse {
    case succeed
    case failed
    
}
