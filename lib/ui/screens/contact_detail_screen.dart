
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/ui/widgets/contact_detail.dart';
import 'package:flutter_contact_list/ui/widgets/contact_header.dart';
import 'package:hive/hive.dart';

class ContactDetail extends StatelessWidget {
    final int index;

    Contact _contactInfo(){
        Box box = Hive.box("contacts");
        return box.getAt(index);

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
            //extendBodyBehindAppBar: true,
            body: Column(
                children: [ContactHeader(contactName: contactName),
                            Detail(contactInfo: contactInfo,)]
            )
        );
    }
}