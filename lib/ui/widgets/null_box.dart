import 'package:flutter/material.dart';

class NullBox extends StatelessWidget {
  final String message;
  final String title;
  const NullBox({Key? key, required this.message, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
