import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_list_database.dart';
import 'package:flutter_contact_list/pic/assets.dart';

class ContactHeader extends StatelessWidget {
  final String contactName; 
  const ContactHeader({Key? key, required this.contactName}) : super(key: key);

  List<Widget> headerPic(String contactName){
    return [Image.asset(
      Assets.placeholder,
      fit: BoxFit.contain,
      height: 200,
    ),
      SizedBox(height: 20),
      Text(contactName,
          style: TextStyle(fontFamily: 'LobsterTwo', fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500, fontSize: 35))
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        height: 300,
        color: Colors.teal[300]!,
        child: Center(
          child: Column(
            children: headerPic(contactName),
          ),
        )
    );
  }
}
