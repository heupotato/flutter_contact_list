
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';
import 'package:flutter_contact_list/pic/assets.dart';
import 'package:flutter_contact_list/ui/widgets/contact_detail.dart';
import 'package:flutter_contact_list/ui/widgets/contact_header.dart';

class ContactDetail extends StatelessWidget {
    final Contact contact;

    ContactDetail({Key? key, required this.contact}) : super(key: key);


    @override
    Widget build(BuildContext context) {
        ///get full information of contact by id
        Contact contactInfo = MockContact.mock(contact.id);
        String contactName = contactInfo.firstName + " " + contactInfo.lastName + contactInfo.id.toString();
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact Detail")
            ),
            //extendBodyBehindAppBar: true,
            body: Column(
                children: [ContactHeader(contactName: contactName),
                            Detail(contactInfo: contactInfo,)]
            )
        );
    }
}