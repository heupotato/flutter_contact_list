
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';
import 'package:flutter_contact_list/pic/assets.dart';

class ContactDetail extends StatelessWidget {
    final Contact contact; 

    final fields = ["First name", "Last name", "Address", "Gender", "Email"]; 
    final divider = Divider(
        color: Colors.teal[900], 
        thickness: 3,
        indent: 50,
        endIndent: 50,
    ); 


    ContactDetail({Key? key, required this.contact}) : super(key: key); 

    List<Widget> appBarPic(String contactName){
        return [Image.asset(
                        Assets.placeholder, 
                        fit: BoxFit.contain, 
                        height: 200,
                    ),
                SizedBox(height: 20), 
                Text(contactName, 
                    style: TextStyle(fontFamily: 'LobsterTwo', fontStyle: FontStyle.italic, 
                                     fontWeight: FontWeight.w500, fontSize: 35))
        ]; 
    } 

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

    Row detailInfo(String title, String info){
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Spacer(),
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
                Spacer()
            ]
        ); 
    }

    List<Row> detailList(List<String> infoList){
        List<Row> detailList = []; 
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
        //get full information of contact by id 
        Contact contactInfo = MockContact.mockContact(contact.id); 
        String contactName = contactInfo.firstName + " " + contactInfo.lastName + contactInfo.id.toString();
        List<String> infoList = contactInfoList(contactInfo); 
        String phone = contactInfo.phoneNumber; 
        return Scaffold(
            appBar: AppBar(
                title: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: appBarPic(contactName),
                    )),
                toolbarHeight: 300,
            ),
            body: bodyContactDetail(infoList, phone, context)
        );
    }
}