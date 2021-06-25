import 'package:flutter/material.dart';
import 'package:flutter_contact_list/services/validator.dart';

class NewContact extends StatefulWidget {
    const NewContact({Key? key }) : super(key: key);

    @override
    _NewContactState createState() => _NewContactState();
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

class _NewContactState extends State<NewContact> {
    late String firstName; 
    late String lastName; 
    late String phoneNumber; 
    String gender = Gender.others.name;
    late String email; 
    late String address; 




    final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

    Widget firstNameField(){
        return TextFormField(
            decoration: InputDecoration(labelText: "First name"),
            validator: (String ? value) =>
                Validator.isFirstName(value!),
            onSaved: (String ? value) => firstName = value!,
        ); 
    }

    Widget lastNameField(){
        return TextFormField(
            decoration: InputDecoration(labelText: "Last name"),
            validator: (String ? value) =>
                Validator.isLastname(value!),
            onSaved: (String ? value) => lastName = value!,
        ); 
    }

    Widget phoneNumberField(){
        return TextFormField(
            decoration: InputDecoration(labelText: "Phone Number"),
            validator: (String ? value) =>
                Validator.isPhoneNumber(value!),
            onSaved: (String ? value) => phoneNumber = value!,
        ); 
    }

    Widget genderField(){
        return DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Gender"),
            onChanged: (Gender ? newValue) => {
                setState(() => gender = newValue!.name)
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
            decoration: InputDecoration(labelText: "Email"),
            onSaved: (String ? value) => email = value!
        ); 
    }

    Widget addressField(){
        return TextFormField(
                decoration: InputDecoration(labelText: "Address"),
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

    void _addNewContact(){
        print("Succeeded"); 
        print(gender);
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text("Create new contact")),
            body: Container(
                margin: EdgeInsets.all(20),
                child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            firstNameField(), 
                            lastNameField(), 
                            phoneNumberField(),
                            genderField(),
                            emailField(), 
                            addressField(), 
                            SizedBox(height: 100), 
                            ElevatedButton(
                                style: raisedButtonStyle,
                                child: Text(
                                    "Submit", 
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)), 
                                onPressed: () => {
                                        if (formKey.currentState?.validate() ?? false){
                                        }
                                        else{
                                            formKey.currentState!.save(),
                                            _addNewContact(), 
                                            Navigator.pop(context)
                                        }   
                                }
                            )
                        ],
                    ),
                ),
            ),
        ); 
    }
}