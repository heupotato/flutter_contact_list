
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact_list_data.dart';

class ContactDetail extends StatelessWidget {
    final Contact contact; 
    ContactDetail({Key? key, required this.contact}) : super(key: key); 
    @override
    Widget build(BuildContext context) {
        var contactName = contact.firstName + " " + contact.lastName + contact.id.toString();
        return Scaffold(
        appBar: AppBar(
            title: Text(contactName),
        ),
        body: Center(
            
        ),
        );
    }
}