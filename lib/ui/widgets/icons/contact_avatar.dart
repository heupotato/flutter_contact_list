import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class ContactAvatar extends StatelessWidget {
  final String name; 
  ContactAvatar({Key? key, required this.name}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.teal[400],
      child: Text(
        name.trim()[0].toUpperCase(),
        style: TextStyle(
          fontSize: 25,
          color: Colors.white
        )
      ),
    );
  }
}
