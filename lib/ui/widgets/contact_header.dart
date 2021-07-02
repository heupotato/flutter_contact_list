import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pic/assets.dart';
import 'package:flutter_contact_list/ui/widgets/avatar_picker_widget.dart';

class ContactHeader extends StatelessWidget {
  final String contactName;
  final int index;
  const ContactHeader({Key? key, required this.contactName, required this.index})
      : super(key: key);

  List<Widget> headerPic(String contactName){
    return [Expanded(child: AvatarPicker(index: index,)),
      SizedBox(height: 5),
      Text(contactName,
          style: TextStyle(fontFamily: 'LobsterTwo', fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500, fontSize: 35))
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        height: 300,
        color: Colors.teal[300]!,
        child: Center(
          child: Column(
            children: headerPic(contactName),
          ),
        )
    );
  }
}
