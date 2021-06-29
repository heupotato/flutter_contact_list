
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter_contact_list/ui/widgets/contact_detail.dart';
import 'package:flutter_contact_list/ui/widgets/contact_header.dart';
import 'package:hive/hive.dart';

class ContactDetail extends StatelessWidget {
    final int index;

    Contact _contactInfo(){
        return ContactsRepository.getContactInfo(index);
    }
    ContactDetail({Key? key, required this.index}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        ///get full information of contact by id
        Contact contactInfo = _contactInfo();
        String contactName = contactInfo.firstName + " " + contactInfo.lastName;
        return Scaffold(
            appBar: AppBar(
                title: Text("Contact Detail")
            ),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Column(
                    children: [ContactHeader(contactName: contactName),
                            Detail(contactInfo: contactInfo,)]
            )
            )
        );
    }
}