import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:hive/hive.dart';

class ContactsRepository{
  static Future<Box<Contact>> loadBox() => Hive.openBox<Contact>("contacts");

  static Box<Contact> getBox() => Hive.box<Contact>("contacts");

  static List<Contact> getAllContacts() => getBox().values.toList();

  static Contact? getContactInfo(int index) => getBox().getAt(index);

  static void updateContact(Contact contact, int index)
              => getBox().putAt(index, contact);

  static void addContact(Contact contact)
              => getBox().add(contact);
              
  static void deleteContact(int index)
              =>getBox().deleteAt(index);
}