
import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';
import 'package:flutter_contact_list/pic/assets.dart';

class ContactDetail extends StatelessWidget {
    final Contact contact; 
    final fields = ["First name", "Last name", "Phone number:", "Gender", "Address", "Email"]; 
    ContactDetail({Key? key, required this.contact}) : super(key: key);

    List<Widget> appBarPic(String contactName){
        return [Image.asset(
                        Assets.placeholder, 
                        fit: BoxFit.contain, 
                        height: 200,
                    ),
                SizedBox(height: 20), 
                Text(contactName)
        ]; 
    } 

    List<String> contactInfoList(Contact contactInfo){
        String gender = contactInfo.gender == 1? "Male" : 
                        (contactInfo.gender == 2 ? "Female" : "Other"); 
        return <String> [contactInfo.firstName, contactInfo.lastName, contactInfo.phoneNumber, 
                        contactInfo.address, gender, contactInfo.email];  
    }

    @override
    Widget build(BuildContext context) {
        //get full information of contact by id 
        Contact contactInfo = MockContact.mockContact(contact.id); 
        String contactName = contactInfo.firstName + " " + contactInfo.lastName + contactInfo.id.toString();
        List<String> infoList = contactInfoList(contactInfo); 
        return Scaffold(
            appBar: AppBar(
                title: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: appBarPic(contactName),
                    )),
                actions: [
                ],
                toolbarHeight: 300,
            ),
            body: Container(  
                child: ListView.builder(
                    itemCount: infoList.length,
                    itemBuilder: (context, index){
                        return Card( child: ListTile(
                            title: Text(fields[index] + ": " + infoList[index]),
                        )); 
                    }
                )
            ),
        );
    }
}