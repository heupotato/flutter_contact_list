import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';
import 'package:flutter_contact_list/ui/screens/contact_detail_screen.dart';
import 'package:flutter_contact_list/ui/screens/new_contact_screen.dart';
import 'package:flutter_contact_list/ui/screens/update_contact_screen.dart';
import 'package:flutter_contact_list/ui/widgets/dialog_action_item.dart';

class ContactListScreen extends StatefulWidget {
    const ContactListScreen({ Key? key }) : super(key: key);

    @override
    _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
    //create some fake data and assign to contactList 
    List<Contact> contactList = MockContact.mocks();

    @override
    void initState() {
        super.initState(); 
        //getAllContact(); 
    }

    _getAllContact() async{
        //use database to get contact 
    }

    _deleteContact(){
        print("Delete");
    }

    _manageContact(String action, int index){
        if (action == "edit"){
            Navigator.push(context, 
                MaterialPageRoute(
                    builder: (context) => UpdateContactScreen(id: index)
            )); 
        }
        else if (action == "delete"){
            //DeleteContact.showDeleteBox(index, context);
            ActionDialog.confirm(
                context: context,
                title: "Delete",
                description: "Do you want to delete this contact?",
                onConfirm: _deleteContact());
        }
    }

    _navigateDetail(int index){
         Navigator.push(
            context, 
            MaterialPageRoute(
                builder: (context) => ContactDetail(contact: contactList[index])
                )
        ); 
    }


    ListTile contactTile(String contactName, String phone, int index)
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
            onSelected: (String value) => _manageContact(value, index),
        ),
        onTap: () => _navigateDetail(index)
        ); 
    }

    _gotoAddNewContact(){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewContactScreen())
        );
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact List"),
                actions: [
                    IconButton(icon: Icon(Icons.add_circle_outline_sharp), onPressed: _gotoAddNewContact)],
            ),
            body: Container(
                padding: EdgeInsets.all(20), 
                child: ListView.builder(
                    itemCount: contactList.length,
                    itemBuilder: (context, index){
                        String contactName = contactList[index].firstName + " " + contactList[index].lastName;
                        String phone = contactList[index].phoneNumber; 
                        return Card(
                            child: contactTile(contactName, phone, index)
                        );
                    }
                )
            )
        );
    }
}