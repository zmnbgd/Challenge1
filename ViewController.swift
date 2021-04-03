//
//  ViewController.swift
//  Challenge1
//
//  Created by Marko Zivanovic on 13.3.21..
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viweer"
        navigationController?.navigationBar.prefersLargeTitles = true 
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // This is a picture lo load
                pictures.append(item)
                //TASK 1. Use Interface Builder to select the text label inside your table view cell and adjust its font size to something larger – experiment and see what looks good.
                pictures.sort()
                // TASK 2. In your main table view, show the image names in sorted order, so “nssl0033.jpg” comes before “nssl0034.jpg”.
            }
        }
        
         print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedPicture = pictures[indexPath.row]
            
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPicturesNumber = pictures.count
            // TASK 3. Rather than show image names in the detail title bar, show “Picture X of Y”, where Y is the total number of images and X is the selected picture’s position in the array. Make sure you count from 1 rather than 0.
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

