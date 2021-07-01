import 'package:flutter/material.dart';
import 'package:flutter_contact_list/data/contact_data.dart';
import 'package:flutter_contact_list/services/validator.dart';
import 'package:flutter_contact_list/storage/repositories/contacts_repositories.dart';
import 'package:flutter_contact_list/ui/widgets/buttons/custom_elevated_button.dart';

class NewContactScreen extends StatefulWidget {
    const NewContactScreen({Key? key }) : super(key: key);

    @override
    _NewContactScreenState createState() => _NewContactScreenState();
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

class _NewContactScreenState extends State<NewContactScreen> {
    late String firstName; 
    late String lastName; 
    late String phoneNumber; 
    Gender gender = Gender.others;
    late String email; 
    late String address; 


    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final OutlineInputBorder outlineTextField = OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.grey,
        ),
    );

    final OutlineInputBorder focusedTextField = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        borderSide: BorderSide(color: Colors.blue),
    );

    InputDecoration fieldDecoration(String label, IconData iconData){
        return InputDecoration(
            labelText: label,
            icon: Icon(iconData, size: 30),
            enabledBorder: outlineTextField,
            focusedBorder: focusedTextField
        );
    }

    Widget firstNameField(){
        return TextFormField(
            decoration: fieldDecoration("First name", Icons.person_sharp),
            validator: Validator.firstName,
            onSaved: (String ? value) => firstName = value!,
        ); 
    }

    Widget lastNameField(){
        return TextFormField(
            decoration: fieldDecoration("Last name", Icons.person_sharp),
            validator: Validator.lastname,
            onSaved: (String ? value) => lastName = value!,
        ); 
    }

    Widget phoneNumberField(){
        return TextFormField(
            decoration: fieldDecoration("Phone number", Icons.phone),
            validator: Validator.phoneNumber,
            onSaved: (String ? value) => phoneNumber = value!,
        ); 
    }

    Widget genderField(){
        return DropdownButtonFormField(
            decoration: fieldDecoration("Gender", Icons.people_alt_outlined),
            onChanged: (Gender ? newValue) => {
                setState(() => gender = newValue!)
            },

            value: Gender.others,
            isExpanded: true,            
            items: Gender.values.map((Gender value) {
                return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                );
            }).toList()
        ); 
    }

    Widget emailField(){
        return TextFormField(
            decoration: fieldDecoration("Email", Icons.email_outlined),
            validator: Validator.email,
            onSaved: (String ? value) => email = value!
        );
    }

    Widget addressField(){
        return TextFormField(
            decoration: fieldDecoration("Address", Icons.home_rounded),
            onSaved: (String ? value) => address = value!
        );  
    }

    int _setGender(Gender gender){
        return gender == Gender.male ? 1 :
        (gender == Gender.female ? 2 : 0);
    }

    final ButtonStyle _raisedButtonStyle = ElevatedButton.styleFrom(
        onPrimary: Colors.teal[900],
        primary: Colors.tealAccent[700],
        minimumSize: Size(100, 40),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
    );

    _onSubmit(){
        if (formKey.currentState?.validate() ?? false){
            formKey.currentState!.save();
            _addNewContact();
            Navigator.pop(context);
        }
    }

    void _addNewContact(){
        Contact newContact = Contact(firstName: firstName, lastName: lastName,
            phoneNumber: phoneNumber, gender:_setGender(gender),
            email: email, address: address);
        ContactsRepository.addContact(newContact);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(title: Text("Create new contact")),
            body: Container(
                margin: EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                firstNameField(), SizedBox(height: 20),
                                lastNameField(), SizedBox(height: 20),
                                phoneNumberField(), SizedBox(height: 20),
                                genderField(), SizedBox(height: 20),
                                emailField(), SizedBox(height: 20),
                                addressField(),
                                SizedBox(height: 50),
                                CustomElevatedButton(title: "Submit", style: _raisedButtonStyle, onPressed: _onSubmit)
                            ],
                        )
                    ),
                ),
            ),
        ); 
    }
}