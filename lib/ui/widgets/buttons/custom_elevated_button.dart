import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final title;
  final style;
  final GestureTapCallback onPressed;
  const CustomElevatedButton({Key? key, required this.title,
    required this.style, required this.onPressed}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style,
        child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        onPressed: onPressed,
    );
  }
}
