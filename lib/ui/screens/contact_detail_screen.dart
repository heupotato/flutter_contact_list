
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter_contact_list/ui/screens/update_contact_screen.dart';
import 'package:flutter_contact_list/ui/widgets/contact_detail.dart';
import 'package:flutter_contact_list/ui/widgets/contact_header.dart';

class ContactDetailScreen extends StatefulWidget {
    final int id;

    ContactDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {

    _getContact(id) => ContactsRepository.getContactInfo(id);

    _gotoUpdateContact() {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateContactScreen(id: widget.id))
        );
    }

    @override
    Widget build(BuildContext context) {
        ///get full information of contact by id
        Contact contactInfo = _getContact(widget.id);
        String contactName = contactInfo.firstName + " " + contactInfo.lastName;
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact Detail"),
                actions: [IconButton(icon: Icon(Icons.edit),
                    onPressed: _gotoUpdateContact)],
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                child: Column(
                    children: [ContactHeader(contactName: contactName),
                        ContactDetail(contactInfo: contactInfo,)]
                )
            )
        );
    }
}