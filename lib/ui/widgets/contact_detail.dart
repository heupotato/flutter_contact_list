import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';

class Detail extends StatelessWidget {
  final Contact contactInfo;
  Detail({Key? key, required this.contactInfo}) : super(key: key);

  final fields = ["First name", "Last name", "Address", "Gender", "Email"];
  final divider = Divider(
    color: Colors.teal[900],
    thickness: 3,
    indent: 200,
    endIndent: 200,
  );

  List<String> contactInfoList(Contact contactInfo){
    String gender = contactInfo.gender == 1? "Male" :
    (contactInfo.gender == 2 ? "Female" : "");
    return <String> [contactInfo.firstName, contactInfo.lastName,
      contactInfo.address, gender, contactInfo.email];

  }

  Text titleInfo(String title){
    return Text(
        title,
        style: TextStyle(fontFamily: 'LobsterTwo', fontSize: 22)
    );
  }

  List<Widget> titleObject(String title){
    return [
      SizedBox(height: 20),
      titleInfo(title),
      divider,
    ];
  }

  Padding detailInfo(String title, String info){
    return Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(title + ": ",
                            style: TextStyle(fontFamily: 'Peddana', fontSize: 25, fontWeight: FontWeight.w700))
                      ]
                  )
              ),
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(info,
                            style: TextStyle(fontFamily: 'Peddana', fontSize: 25))
                      ]
                  )
              ),
            ])
    );
  }

  List<Padding> detailList(List<String> infoList){
    List<Padding> detailList = [];
    for (int i = 0; i<infoList.length; i++)
      detailList.add(detailInfo(fields[i], infoList[i]));
    return detailList;
  }

  Widget bodyContactDetail(List<String> infoList, String phone, BuildContext context){
    List<Widget> colChildren = [];
    colChildren.addAll(titleObject("Phone"));
    colChildren.add(detailInfo("Phone Number", phone));
    colChildren.addAll(titleObject("Detail"));
    colChildren.addAll(detailList(infoList));
    return Column(
      children: colChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> infoList = contactInfoList(contactInfo);
    String phone = contactInfo.phoneNumber;
    return Container(child: bodyContactDetail(infoList, phone, context));
  }
}
