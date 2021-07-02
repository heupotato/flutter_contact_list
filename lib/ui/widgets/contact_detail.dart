import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;
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
      shadowColor: Colors.black,
      child: ListTile(
        title: shownInfo(info, title),
        subtitle: Text(title),
        leading: Icon(icon, color: Colors.teal[400], size: 30),
      ),
    );
  }

  Card actionCard (String title, String info, IconData icon){
    if (info == "" || (title != "Email" && title != "Phone Number"))
      return detailInfo(title, info, icon);
    String action = title == "Phone Number" ? "tel" : "mailto";
    return Card(
      shadowColor: Colors.black,
      child: ListTile(
        title: shownInfo(info, title),
        subtitle: Text(title),
        leading: Icon(icon, color: Colors.teal[400], size: 30),
        onTap: () => urlLauncher.launch('$action://$info')
      ),
    );
  }

  List<Card> detailList(List<String> infoList){
    List<Card> detailList = [];
    for (int i = 0; i<infoList.length; i++)
      detailList.add(actionCard(fields[i], infoList[i], iconFields[i]));
    return detailList;
  }

  Widget bodyContactDetail(List<String> infoList, String phone, BuildContext context){
    List<Widget> colChildren = [];
    colChildren.addAll(titleObject("Phone"));
    colChildren.add(actionCard("Phone Number", phone, Icons.phone));
    colChildren.addAll(titleObject("Detail"));
    colChildren.addAll(detailList(infoList));
    colChildren.add(SafeArea(child: SizedBox(height: 20)));
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
