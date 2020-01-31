//
//  HeroController.swift
//  MyHero
//
//  Created by Aaron Cleveland on 1/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import CoreData

class HeroController {
    // grabbing api
    private let api = URL(string: "https://www.superheroapi.com/api.php/10221569289250140")
    // grabbing firebase database
    private let firebase = URL(string: "https://superhero-b9019.firebaseio.com/")
    
    static let shared = HeroController()
    typealias completionWithError = (Error?) -> ()
    let context = CoreDataStack.shared.mainContext
    
    var heroReps: [HeroResults.HeroRepresentation]?
    
    func getHeros(name: String, complete: @escaping completionWithError) {
        let searchURL = api?.appendingPathComponent("search").appendingPathComponent(name)
        guard let request = NetworkService.createRequest(url: searchURL, method: .get) else {
            let error = NSError(domain: "HeroController.getHeros.request", code: 400, userInfo: nil)
            complete(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                complete(error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "HeroController.getHeroes.dataTask.data", code: 0, userInfo: nil)
                complete(error)
                return
            }
            print("JSON String: \(String(data: data, encoding: .utf8))")
            
            guard let optionalHeroRepresentations = NetworkService.decode(to: HeroResults.self, data: data) else {
                let error = NSError(domain: "HeroController.getHeroes.dataTask.decode", code: 0, userInfo: nil)
                complete(error)
                return
            }
            
            var heroReps = [HeroResults.HeroRepresentation]()
            for (representation) in optionalHeroRepresentations.results {
                heroReps.append(representation)
            }
            print(heroReps)
            self.heroReps = heroReps
            complete(nil)
        }.resume()
    }
    
    func saveHero() {
        
    }
    
    func updateHero() {
        
    }
    
    func updateHeros(with: [HeroResults.HeroRepresentation]) {
        
    }
    
    func deleteHero() {
        
    }
}
