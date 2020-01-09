//
//  ViewController.swift
//  MoveTableViewExample
//
//  Created by Soemsak on 9/1/2563 BE.
//  Copyright © 2563 Chatto. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var number = [
        ["Data1","Data2","Data3"],
        ["Data4","Data5","Data6","Data7"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isEditing = !isEditing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Data group \(section + 1)"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return number.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)
        cell.textLabel?.text = number[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = number[sourceIndexPath.section][sourceIndexPath.row]
        number[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        number[destinationIndexPath.section].insert(itemToMove, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
}
