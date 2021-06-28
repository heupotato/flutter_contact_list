
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/ui/widgets/contact_detail.dart';
import 'package:flutter_contact_list/ui/widgets/contact_header.dart';
import 'package:hive/hive.dart';

class ContactDetailScreen extends StatelessWidget {
    final Contact contact;

    ContactDetailScreen({Key? key, required this.contact}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        ///get full information of contact by id
        Contact contactInfo = contact;
        String contactName = contactInfo.firstName + " " + contactInfo.lastName;
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact Detail")
            ),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Column(
                    children: [ContactHeader(contactName: contactName),
                            ContactDetail(contactInfo: contactInfo,)]
            )
            )
        );
}