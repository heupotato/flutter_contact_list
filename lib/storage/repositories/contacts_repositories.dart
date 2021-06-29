import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:hive/hive.dart';

class ContactsRepository{
  static Future<Box<Contact>> loadBox(){
    return Hive.openBox<Contact>("contacts");
  }

  static Box<Contact> getBox() {
    return Hive.box<Contact>("contacts");
  }

  static List<Contact>? getAllContacts() {
    final contactsData = getBox();
    return contactsData.values.toList();
  }
  static Contact? getContactInfo(int index){
    Box contacts = getBox();
    return contacts.getAt(index);
  }
}