import 'package:flutter/material.dart';

class NullWidget extends StatelessWidget {
  final String message;
  const NullWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message)
    );
  }
}
