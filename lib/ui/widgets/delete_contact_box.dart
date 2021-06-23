import 'package:flutter/material.dart';

class DeleteContact{

    static _deleteContact(int index){
        print("Deleting"); 
        //call database's method to delete object by index

    }
    static Future<void> showDeleteBox(int index, BuildContext context) async{
        return showDialog(
            context: context, 
            barrierDismissible: false,
            builder: (BuildContext context){
                return AlertDialog(
                    title: Text("Delete this contact"),
                    content: SingleChildScrollView(
                        child: Text("Do you want to delete this contact?"),
                    ),
                    actions: [
                        TextButton(
                            child: Text("Confirm"), 
                            onPressed: () {
                                _deleteContact(index); 
                                Navigator.of(context).pop(); 
                            },
                        ), 
                        TextButton(
                            child: Text("Cancel"),
                            onPressed: () {
                                Navigator.of(context).pop(); 
                            },
                        )
                    ],
                ); 
            }
        ); 
    }
}
