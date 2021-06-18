import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return Provider(
            builder: (_) => Appdata
        );
    }
}

