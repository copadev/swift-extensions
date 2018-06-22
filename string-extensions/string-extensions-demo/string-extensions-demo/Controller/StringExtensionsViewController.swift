//
//  StringExtensionsViewController.swift
//  string-extensions-demo
//
//  Created by Seasoft on 6/18/18.
//  Copyright © 2018 Huy Duong. All rights reserved.
//

import UIKit

class StringExtensionsViewController: UITableViewController {
    

    // MARK: - UITABLEVIEW DATASOURCE & UITABLEVIEW DELEGATE

    /**
     * Asks the data source to return the number of sections in the table view.
     */
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    /**
     * Tells the data source to return the number of rows in a given section of a table view.
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extensionsList.count
    }
    
    
    /**
     * Asks the data source for a cell to insert in a particular location of the table view.
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let extensions: StringExtensions = extensionsList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(extensions.id). \(extensions.name)"
        return cell
    }
    
    
    /**
     * Tells the delegate that the specified row is now selected.
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDemoVC", sender: nil)
    }
    
    
    /**
     * Notifies the view controller that a segue is about to be performed.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "goToDemoVC",
            let selectedRow = self.tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? DemoViewController else {
                return
        }
        
        let extensions: StringExtensions = extensionsList[selectedRow.row]
        destinationVC.stringExtensions = extensions
        self.tableView.deselectRow(at: selectedRow, animated: false)

    }

    
}










