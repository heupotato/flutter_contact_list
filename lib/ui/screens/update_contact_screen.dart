import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/services/validator.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter_contact_list/ui/screens/null_screen.dart';

class UpdateContactScreen extends StatefulWidget {
  final int id;
  const UpdateContactScreen({ Key? key, required this.id }) : super(key: key);


  @override
  _UpdateContactScreenState createState() => _UpdateContactScreenState();
}

enum Gender {male, female, others}

extension GenderName on Gender{
    String get name{
        switch (this){
            case Gender.male:
                return "Male";
            case Gender.female:
                return "Female";
            case Gender.others:
                return "Others";
        }
    }
}
class _UpdateContactScreenState extends State<UpdateContactScreen> {
    late String firstName; 
    late String lastName; 
    late String phoneNumber; 
    Gender gender = Gender.others;
    late String email; 
    late String address; 


    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Contact ? _contactInfo(int index) => ContactsRepository.getContactInfo(index);


    Widget firstNameField(String oldFirstName){
        return TextFormField(
            initialValue: oldFirstName,
            decoration: InputDecoration(labelText: "First name"),
            validator: Validator.firstName,
            onSaved: (String ? value) => firstName = value!,
        );
    }

    Widget lastNameField(String oldLastName){
        return TextFormField(
            initialValue: oldLastName,
            decoration: InputDecoration(labelText: "Last name"),
            validator: Validator.lastname,
            onSaved: (String ? value) => lastName = value!,
        );
    }

    Widget phoneNumberField(String oldPhoneNumber){
        return TextFormField(
            initialValue: oldPhoneNumber,
            decoration: InputDecoration(labelText: "Phone Number"),
            validator: Validator.phoneNumber,
            onSaved: (String ? value) => phoneNumber = value!,
        );
    }

    Widget genderField(Gender oldGender){
        return DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Gender"),
            onChanged: (Gender ? newValue) => {
                setState(() => gender = newValue!)
            },

            value: oldGender,
            isExpanded: true,
            items: Gender.values.map((Gender value) {
                return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                );
            }).toList()
        );
    }

    Widget emailField(String oldEmail){
        return TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            initialValue: oldEmail,
            onSaved: (String ? value) => email = value!
        ); 
    }

    Widget addressField(String oldAddress){
        return TextFormField(
                decoration: InputDecoration(labelText: "Address"),
                initialValue: oldAddress,
                onSaved: (String ? value) => address = value!
        );  
    }

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        onPrimary: Colors.teal[900],
        primary: Colors.tealAccent[700],
        minimumSize: Size(100, 40),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
    );

    void _updateContact(int index){
        Contact newContact = Contact(firstName: firstName, lastName: lastName,
            phoneNumber: phoneNumber, gender:_setGender(gender),
            email: email, address: address);
        ContactsRepository.updateContact(newContact, index);
    }

    void _onSubmit(BuildContext context){
        if (formKey.currentState?.validate() ?? false){
            formKey.currentState?.save();
            _updateContact(widget.id);
            Navigator.pop(context);
        }  
    }
    Gender _getGender(int gender){
        return gender == 1 ? Gender.male :
        (gender == 2 ? Gender.female : Gender.others );
    }

    int _setGender(Gender gender){
        return gender == Gender.male ? 1 :
        (gender == Gender.female ? 2 : 0);
    }
    @override
    Widget build(BuildContext context) {
        //get data of old contact by its id 
        final oldContact = _contactInfo(widget.id);
        if (oldContact != null)
        return Scaffold(
            appBar: AppBar(title: Text("Edit contact" )),
            resizeToAvoidBottomInset: false,
            body: Container(
                margin: EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            firstNameField(oldContact.firstName), 
                            lastNameField(oldContact.lastName), 
                            phoneNumberField(oldContact.phoneNumber),
                            genderField(_getGender(oldContact.gender)),
                            emailField(oldContact.email), 
                            addressField(oldContact.address), 
                            SizedBox(height: 100), 
                            ElevatedButton(
                                style: raisedButtonStyle,
                                child: Text(
                                    "Submit", 
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)), 
                                onPressed: () => _onSubmit(context)
                            )
                        ],
                    ),
                ),
            ),
        );
        return NullScreen(message: "Cannot edit cause this contact doesn't exist",
            title: "Edit contact");
    }
}