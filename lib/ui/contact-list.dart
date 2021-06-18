import 'package:flutter/material.dart';

//fake data, may remove later 
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
    List<Contact> contactList = List.generate(10, (_) => Contact(id: 1, firstName: "ahihi", lastName: "hehe", phoneNumber: "021")); 

    @override
    void initState() {
        super.initState(); 
        //getAllContact(); 
    }

    getAllContact() async{
        //database method get contact 
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact List"),
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
                            ),
                        ); 
                    }
                )
            )
        );
    }
}