import 'package:flutter/material.dart';
import 'package:flutter_contact_list/ui/contact-detail.dart';

//fake class and data
//will remove later 
class Contact{
    int id;
    String firstName; 
    String lastName; 
    String phoneNumber;

    Contact({required this.id, required this.firstName, required this.lastName, required this.phoneNumber}); 

    @override 
    String toString() {
        return("id: $id\nFirst name: $firstName\nLast name: $lastName\nTel: $phoneNumber"); 
  }
}

class ContactList extends StatefulWidget {
    const ContactList({ Key? key }) : super(key: key);

    @override
    _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> { 
    //create some fake data and assign to contactList 
    List<Contact> contactList = List.generate(10, (int index) => Contact(id: index, firstName: "First ", lastName: "Last", phoneNumber: "0123456789")); 

    @override
    void initState() {
        super.initState(); 
        //getAllContact(); 
    }

    getAllContact() async{
        //use database to get contact 
    }

    manageContact(String action){
        print(action); 
    }

    @override
    Widget build(BuildContext context) {
        _pushAdd(){

        }
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact List"),
                actions: [
                    IconButton(icon: Icon(Icons.add_circle_outline_sharp), onPressed: _pushAdd),
                ],
            ),
            body: Container(
                padding: EdgeInsets.all(20), 
                child: ListView.builder(
                    itemCount: contactList.length,
                    itemBuilder: (context, index){
                        var contactName = contactList[index].firstName + " " + contactList[index].lastName;
                        var phone = contactList[index].phoneNumber; 
                        return Card(
                            child: ListTile(   
                                title: Text(contactName),
                                subtitle: Text(phone),
                                trailing: PopupMenuButton(
                                    itemBuilder: (context) {
                                        return [
                                            PopupMenuItem(
                                                value: "edit",
                                                child: Text("Edit"),
                                            ), 
                                            PopupMenuItem(
                                                value: "delete",
                                                child: Text("Delete"),
                                            ),
                                        ]; 
                                    },
                                    onSelected: (String value) => manageContact(value),
                                ),
                                onTap: () => Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                        builder: (context) => ContactDetail(contact: contactList[index])
                                        )
                                )
                            ),
                        ); 
                    }
                )
            )
        );
    }
}