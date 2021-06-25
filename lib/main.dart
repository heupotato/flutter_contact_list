import 'package:flutter/material.dart';
import 'package:flutter_contact_list/ui/screens/contact_list_screen.dart';
void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: "My contact list",
        theme: ThemeData(primaryColor: Colors.teal[700]),
        home: ContactListScreen(),
      ); 
    }
}

