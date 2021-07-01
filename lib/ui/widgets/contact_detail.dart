import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';

class ContactDetail extends StatelessWidget {
  final Contact contactInfo;
  ContactDetail({Key? key, required this.contactInfo}) : super(key: key);

  final fields = ["First name", "Last name", "Address", "Gender", "Email"];
  final iconFields = [
    Icons.person_sharp,
    Icons.person_sharp,
    Icons.home_rounded,
    Icons.people_alt_outlined,
    Icons.email_outlined
  ];

  final divider = Divider(
    color: Colors.teal[900],
    thickness: 3,
    indent: 70,
    endIndent: 70,
  );

  List<String> contactInfoList(Contact contactInfo){
    String gender = contactInfo.gender == 1? "Male" :
    (contactInfo.gender == 2 ? "Female" : "Others");
    return <String> [contactInfo.firstName, contactInfo.lastName,
      contactInfo.address, gender, contactInfo.email];
  }

  Text titleInfo(String title){
    return Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
    );
  }

  List<Widget> titleObject(String title){
    return [
      SizedBox(height: 20),
      titleInfo(title),
      divider,
    ];
  }

  Text shownInfo(String info, String title){
    if (info == "")
      return Text(
        "Edit to add " + title,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.grey
        ),
      );
    return Text(info);
  }

  Card detailInfo(String title, String info, IconData icon){
    return Card(
      child: ListTile(
        title: shownInfo(info, title),
        subtitle: Text(title),
        leading: Icon(icon, color: Colors.teal[400], size: 30),
      ),
    );
  }

  List<Card> detailList(List<String> infoList){
    List<Card> detailList = [];
    for (int i = 0; i<infoList.length; i++)
      detailList.add(detailInfo(fields[i], infoList[i], iconFields[i]));
    return detailList;
  }

  Widget bodyContactDetail(List<String> infoList, String phone, BuildContext context){
    List<Widget> colChildren = [];
    colChildren.addAll(titleObject("Phone"));
    colChildren.add(detailInfo("Phone Number", phone, Icons.phone));
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
