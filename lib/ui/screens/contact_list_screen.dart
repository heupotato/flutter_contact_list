import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';
import 'package:flutter_contact_list/ui/screens/contact_detail_screen.dart';

class ContactList extends StatefulWidget {
    const ContactList({ Key? key }) : super(key: key);

    @override
    _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> { 
    //create some fake data and assign to contactList 
    List<Contact> contactList = MockContact.mocks(); 

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

    navigateDetail(int index){
         Navigator.push(
            context, 
            MaterialPageRoute(
                builder: (context) => ContactDetail(contact: contactList[index])
                )
        ); 
    }

    ListTile showContactTile(String contactName, String phone, int index)
    {
        return 
        ListTile(   
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
        onTap: () => navigateDetail(index)
        ); 
    }
    
    @override
    Widget build(BuildContext context) {
        _pushAdd(){

        }
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact List"),
                actions: [
                    IconButton(icon: Icon(Icons.add_circle_outline_sharp), onPressed: _pushAdd) ],
            ),
            body: Container(
                padding: EdgeInsets.all(20), 
                child: ListView.builder(
                    itemCount: contactList.length,
                    itemBuilder: (context, index){
                        String contactName = contactList[index].firstName + " " + contactList[index].lastName;
                        String phone = contactList[index].phoneNumber; 
                        return Card(
                            child: showContactTile(contactName, phone, index)
                        );
                    }
                )
            )
        );
    }
}