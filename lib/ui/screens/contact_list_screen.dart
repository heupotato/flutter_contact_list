
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter_contact_list/ui/screens/contact_detail_screen.dart';
import 'package:flutter_contact_list/ui/screens/new_contact_screen.dart';
import 'package:flutter_contact_list/ui/screens/update_contact_screen.dart';
import 'package:flutter_contact_list/ui/widgets/dialog_action_item.dart';
import 'package:hive_flutter/adapters.dart';

class ContactListScreen extends StatefulWidget {
    const ContactListScreen({ Key? key }) : super(key: key);

    @override
    _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  final List<Contact> contactList = [];
  @override
  void initState() {
    super.initState();
    //getAllContact();
  }

  _getAllContacts() {
    contactList.addAll(ContactsRepository.getAllContacts()!.toList());
  }

  _deleteContact() {
    print("Delete");
  }

  _manageContact(String action, int index){
      if (action == "edit"){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => UpdateContactScreen(id: index)
          ));
    }
    else if (action == "delete") {
      //DeleteContact.showDeleteBox(index, context);
      ActionDialog.confirm(
          context: context,
          title: "Delete",
          description: "Do you want to delete this contact?",
          onConfirm: _deleteContact);
    }
  }

  _navigateDetail(int index){
    if (ContactsRepository.getContactInfo(index) != null)
       Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => 
                  ContactDetailScreen(contact: ContactsRepository.getContactInfo(index)!)
              )
      );
  }


  ListTile contactTile(String contactName, String phone, int index) {
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

  _gotoAddNewContact() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewContactScreen())
    );
  }

  Widget nullBox(){
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
        actions: [
          IconButton(icon: Icon(Icons.add_circle_outline_sharp),
              onPressed: _gotoAddNewContact)
        ],
      ),
      body: Center(
        child: Text("You haven't had any contacts yet."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _getAllContacts();
    if (contactList.length !=0)
      return Scaffold(
          appBar: AppBar(
            title: Text("Contact List"),
            actions: [
              IconButton(icon: Icon(Icons.add_circle_outline_sharp),
                  onPressed: _gotoAddNewContact)
            ],
          ),
          body: Container(
              padding: EdgeInsets.all(20),
              child: ValueListenableBuilder(
                  valueListenable: ContactsRepository.getBox().listenable(),
                  builder: (context, Box contactsBox, _) {
                    return ListView.builder(
                        itemCount: contactsBox.length,
                        itemBuilder: (context, index) {
                          final contact = contactList[index];
                          String contactName = contact.firstName + " " +
                              contact.lastName;
                          String phone = contact.phoneNumber;
                          return Card(
                            child: contactTile(contactName, phone, index),
                          );
                        }
                    );
                  }
              )
          )
      );
    return nullBox();
  }
}