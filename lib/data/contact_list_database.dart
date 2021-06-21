import 'package:moor_flutter/moor_flutter.dart';
part 'contact_list_database.g.dart';

class Contacts extends Table{
   IntColumn get id => integer().autoIncrement()();
   TextColumn get firstName =>text().withLength(min: 1, max: 20)(); 
   TextColumn get lastName =>text().withLength(min: 1, max: 20)(); 
   BoolColumn get gender => boolean().withDefault(Constant(false))(); 
   TextColumn get phoneNumber => text().withLength(max: 15)(); 
   TextColumn get email => text().withLength(max: 50)(); 
   TextColumn get address => text().withLength(max: 100)(); 
}

@UseMoor(tables: [Contacts])
class ContactListDatabase extends _$ContactListDatabase{
    ContactListDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', 
    logStatements: true)); 
    
    @override
    int get schemaVersion => 1;

    Future<List<Contact>> getAllContacts() => select(contacts).get(); 
    Stream<List<Contact>> watchAllContacts() => select(contacts).watch();
    Future insertContact(Contact contact) => into(contacts).insert(contact);
    Future updateContact(Contact contact) => update(contacts).replace(contact);
    Future deleteContact(Contact contact) => delete(contacts).delete(contact);
}

