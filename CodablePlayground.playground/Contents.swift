import Foundation

struct Contact: Codable {
    let name: FullName
    let address: String
    let phoneNumber: Int?
}

struct FullName: Codable {
    let first: String
    let last: String
}

let fullName = FullName(first: "David", last: "Para")
let address = "123 Main St. Chicago, IL 60601"
let phoneNumber = 15551234567
let contact = Contact(name: fullName, address: address, phoneNumber: phoneNumber)
let contacts = [contact]

var jsonEncoded: Data?
do {
    jsonEncoded = try JSONEncoder().encode(contacts)
} catch let error {
    print(error.localizedDescription)
}

if let jsonEncoded = jsonEncoded,
    let jsonString = String(data: jsonEncoded, encoding: .utf8) {
    print(jsonString)
}

var contactsArray = [Contact]()
if let jsonUrl = Bundle.main.url(forResource: "Contacts", withExtension: "json") {
    do {
        let jsonData = try Data(contentsOf: jsonUrl)
        contactsArray = try JSONDecoder().decode([Contact].self, from: jsonData)
    } catch let error {
        print(error.localizedDescription)
    }
}

for contact in contactsArray {
    print(contact)
}

