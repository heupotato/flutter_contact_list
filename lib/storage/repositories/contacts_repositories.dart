import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:hive/hive.dart';

class ContactsRepository{
  static List<Contact> getAllContacts() {
    final contactsData = Hive.box("contacts");
    List<Contact> contactList = [];
    for (int i = 0; i < contactsData.length; i++)
      contactList.add(contactsData.getAt(i) as Contact);
    return contactList;
  }

  static Contact getContactInfo(int index){
    Box contacts = getBox();
    return contacts.getAt(index);
  }
  static Future<void> openBox(){
    return Hive.openBox("contacts");
  }
  static Box getBox() {
    return Hive.box("contacts");
  }
}