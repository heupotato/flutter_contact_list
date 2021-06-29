import 'package:hive/hive.dart';

part 'contact_data.g.dart';
@HiveType(typeId: 0)
class Contact{
  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  int gender;

  @HiveField(4)
  String email;

  @HiveField(5)
  String address;

  Contact({required this.firstName, required this.lastName, required this.phoneNumber,
    this.address = "", this.email ="", this.gender = 0});

}