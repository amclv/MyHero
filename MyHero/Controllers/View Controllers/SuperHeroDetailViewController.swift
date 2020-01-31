//
//  ViewController.swift
//  MyHero
//
//  Created by Aaron Cleveland on 1/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import UIKit

class SuperHeroDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let heroController = HeroController()
        heroController.getHeros(name: "superman", complete: { (error) in
            let hero = heroController.heroReps?[0]
            let urlString = heroController.heroReps?[0].image.urlString
            URLSession.shared.dataTask(with: URL(string: urlString!)!) { (data, _, _) in
                DispatchQueue.main.async {
                    self.title = hero?.name
                    self.imageView.image = UIImage(data: data!)
                }
            }.resume()
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
