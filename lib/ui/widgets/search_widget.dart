import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onChanged;
  SearchBox({Key? key, required this.onChanged}) : super(key: key);

  final OutlineInputBorder outlineTextField = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
  );

  final OutlineInputBorder focusedTextField = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
    borderSide: BorderSide(color: Colors.blue),
  );

  InputDecoration _searchFieldDecoration(String label, IconData iconData){
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(iconData, size: 30),
      enabledBorder: outlineTextField,
      focusedBorder: focusedTextField,
      fillColor: Colors.white,
      filled: true
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 12, top: 15),
        child: TextFormField(
          decoration: _searchFieldDecoration("Search", Icons.search),
          onChanged: onChanged,
      )
    );
  }
}
