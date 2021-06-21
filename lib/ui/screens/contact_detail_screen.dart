
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';

class ContactDetail extends StatelessWidget {
    final Contact contact; 
    ContactDetail({Key? key, required this.contact}) : super(key: key); 
    @override
    Widget build(BuildContext context) {
        //get full information of contact by id 
        Contact contactInfo = MockContact.mockContact(contact.id); 
        var contactName = contactInfo.firstName + " " + contactInfo.lastName + contactInfo.id.toString();
        return Scaffold(
        appBar: AppBar(
            title: Text(contactName),
        ),
        body: Center(      
        ),
        );
    }
}