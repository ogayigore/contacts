//
//  ViewController.swift
//  ContactsList
//
//  Created by Игорь Огай on 13/03/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: ContactsPresenter!
    
    var contactStore = CNContactStore()
    var contacts = [Contact]()
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    private let kTableViewCell = UINib(nibName: "ContactsTableViewCell", bundle: nil)
    private let kTableViewReuseIdentifier = "kContactsTableViewReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.register(kTableViewCell, forCellReuseIdentifier: kTableViewReuseIdentifier)
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactStore.requestAccess(for: .contacts) {
            (success, error) in
            if success {
                print("Authorization success")
            }
        }
        fetchContacts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactsTableView.dequeueReusableCell(withIdentifier: kTableViewReuseIdentifier,
                                                               for: indexPath) as? ContactsTableViewCell else {
            return UITableViewCell()
        }
        let contactToDisplay = contacts[indexPath.row]
        cell.nameLabel?.text = contactToDisplay.name
        cell.phoneLabel?.text = contactToDisplay.phone
        return cell
    }
    
    func fetchContacts() {
        
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingP) in
            
            let name = contact.givenName
            let familyName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            
            let contactToAppend = Contact(name: name + " " + familyName, phone: number!)
            
            self.contacts.append(contactToAppend)
        }
    }
}

