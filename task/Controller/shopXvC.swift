//
//  shopXvC.swift
//  task
//
//  Created by Mostafa Diaa on 1/10/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class shopXvC: UIViewController {
    @IBOutlet weak var dataTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveData()
         self.dataTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
}
//retriveData
extension shopXvC {
    @discardableResult
    func retriveData() -> ([store]?, [gifts]?) {
        if let url = Bundle.main.url(forResource: "json", withExtension: "txt") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(responseData.self, from: data)
                return (jsonData.stores, jsonData.gifts)

            } catch {
                print(error.localizedDescription)
            }
        }
        return (nil,nil)
    }
}

//view the data 
extension shopXvC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  retriveData().1 != nil{
            return  retriveData().1!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = dataTable.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let gift = self.retriveData().1![indexPath.row]
        if let store = self.retriveData().0!.filter({ (store) -> Bool in
            return store.id == gift.store
        }).first{
            cell.viewCell(store: store, gift: gift)
        }
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  201.5
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
}
