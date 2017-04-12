//
//  ViewController.swift
//  MyCollection
//
//  Created by Nannapaneni, Vijay X [Levi, Ray & Shoup Inc Contractor for Sprint] on 4/10/17.
//  Copyright © 2017 Crap App. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allPics : [Picit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let mycontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            allPics = try mycontext.fetch(Picit.fetchRequest())
            tableView.reloadData()
            
        }
        catch {
            print("We are experiencing errors In pulling the pics :(")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let picit = allPics[indexPath.row]
        cell.textLabel?.text = picit.title
        cell.imageView?.image = UIImage(data: picit.selectedImage as! Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mycontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let picit = allPics[indexPath.row]
        mycontext.delete(picit)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}

