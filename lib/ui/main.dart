import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact-list-database.dart';
import 'package:flutter_contact_list/ui/contact-list.dart';
import 'package:provider/provider.dart'; 
void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
       return Provider(
         create: (_) => ContactListDatabase(), 
         child: MaterialApp(
           title: 'Contact List', 
           home: ContactList(),
          ),
        ); 
    }
}

