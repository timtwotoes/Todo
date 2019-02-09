//
//  NotesViewController.swift
//  Todo
//
//  Created by Tim Wolff on 09/02/2019.
//  Copyright © 2019 Tim Wolff. All rights reserved.
//

import Cocoa

class NotesViewController: NSViewController {
    static let cellDynamicTextField = NSUserInterfaceItemIdentifier(rawValue: "cellDynamicTextField")
    
    private static let loremipsum = """
                   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elit at imperdiet dui accumsan sit amet nulla. Ac tortor vitae purus faucibus ornare. Et netus et malesuada fames. Iaculis at erat pellentesque adipiscing commodo elit at. Magna fringilla urna porttitor rhoncus dolor purus.
                   """
    
    @IBOutlet weak var tableView: NSTableView!
    
    private var notes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNewRandomNote(self)
    }
    
    @IBAction func addNewRandomNote(_ sender: Any) {
        let note = randomLoremIpsumString()
        let indexSet = IndexSet(integer: tableView.numberOfRows)
        notes.append(note)
        tableView.insertRows(at: indexSet, withAnimation: .slideRight)
    }
    
    @IBAction func reloadAllNotes(_ sender: Any) {
        tableView.reloadData()
    }
}

// MARK: Data source for the notes table
extension NotesViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return notes.count
    }
}

// MARK: Table delegate for the notes table
extension NotesViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NotesViewController.cellDynamicTextField, owner: self) as? NSTableCellView else {
            return nil
        }
        
        cell.textField?.stringValue = notes[row]

        return cell
    }
}

// MARK: Convenience functions
extension NotesViewController {
    func randomLoremIpsumString() -> String {
        let minimumCharacters = 10
        let upperLimit = NotesViewController.loremipsum.count - minimumCharacters
        let startIndex = NotesViewController.loremipsum.index(NotesViewController.loremipsum.startIndex, offsetBy: minimumCharacters)
        let endIndex = NotesViewController.loremipsum.index(startIndex, offsetBy: Int.random(in: minimumCharacters..<upperLimit))
        return String(NotesViewController.loremipsum[startIndex..<endIndex])
    }
}
