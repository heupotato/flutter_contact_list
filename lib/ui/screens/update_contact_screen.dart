import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';
import 'package:flutter_contact_list/services/validator.dart';

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

    void _updateContact(){
        print("Succeeded"); 
        print(firstName); 
    }

    void _onSubmit(BuildContext context){
        if (formKey.currentState?.validate() ?? false){
            formKey.currentState?.save();
            _updateContact();
            Navigator.pop(context);
        }  
    }
    Gender _getGender(int gender){
        return gender == 1 ? Gender.male :
        (gender == 2 ? Gender.female : Gender.others );
    }
    @override
    Widget build(BuildContext context) {
        //get data of old contact by its id 
        final oldContact = MockContact.mock(widget.id);

        return Scaffold(
            appBar: AppBar(title: Text("Edit contact" )),
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
    }
}