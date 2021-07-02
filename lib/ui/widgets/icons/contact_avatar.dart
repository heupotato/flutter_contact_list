import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:mdi/mdi.dart';

class ContactAvatar extends StatelessWidget {
  final String name;
  final int index;
  ContactAvatar({Key? key, required this.name, required this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String? path = ContactsRepository.getContactAvatar(index);
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.teal[400],
      child: (path!=null && path!= "")
          ? ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.file(
              File(path!),
              width: 40,
              height: 40,
              fit: BoxFit.fill,
          ))
          :
          Text(
          name.trim()[0].toUpperCase(),
          style: TextStyle(
            fontSize: 25,
            color: Colors.white
        )
      ),
    );
  }
}
