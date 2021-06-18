import 'package:flutter/material.dart';
import 'package:flutter_contact_list/ui/contact-list.dart';
void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: "My contact list",
        theme: ThemeData(accentColor: Colors.teal), 
        home: ContactList(), 
      ); 
    }
}

