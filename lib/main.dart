import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter_contact_list/ui/screens/contact_list_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ContactAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: "My contact list",
        theme: ThemeData(primaryColor: Colors.teal[700]),
        home: FutureBuilder(
          future: ContactsRepository.openBox(),
          builder: (BuildContext context, AsyncSnapshot snapshot)  {
            if (snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError)
                return Text(snapshot.error.toString());
              else{
                return ContactListScreen();
              }
            } else
              return Scaffold();
          },
        )
      ); 
    }
}

