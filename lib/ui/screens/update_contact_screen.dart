import 'package:flutter/material.dart';
import 'package:flutter_contact_list/mockdata/mock_contact.dart';

class UpdateContact extends StatefulWidget {
  final int id; 
  const UpdateContact({ Key? key, required this.id }) : super(key: key);


  @override
  _UpdateContactState createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
    late String firstName; 
    late String lastName; 
    late String phoneNumber; 
    String gender = ""; 
    late String email; 
    late String address; 

    List<String> genderList = ["Male", "Female", "Others"]; 

    final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

    Widget firstNameField(String oldFirstName){
        return TextFormField(
            decoration: InputDecoration(labelText: "First name"),
            initialValue: oldFirstName,
            validator: (String ? value) {
                if (value==null || value.isEmpty){
                    return "First name is required"; 
                }
            },
            onSaved: (String ? value) => firstName = value!,
        ); 
    }

    Widget lastNameField(String oldLastName){
        return TextFormField(
            decoration: InputDecoration(labelText: "Last name"),
            initialValue: oldLastName,
            validator: (String ? value) {
                if (value==null || value.isEmpty){
                    return "Last name is required"; 
                }
            },
            onSaved: (String ? value) => lastName = value!,
        ); 
    }

    Widget phoneNumberField(String oldPhone){
        return TextFormField(
            decoration: InputDecoration(labelText: "Phone Number"),
            initialValue: oldPhone,
            validator: (String ? value) {
                if (value==null || value.isEmpty){
                    return "Phone number is required"; 
                }
                try{
                    int.parse(value); 
                }
                catch (err){
                    return "Invalid phone number"; 
                }
            },
            onSaved: (String ? value) => phoneNumber = value!,
        ); 
    }

    Widget genderField(String oldGender){
        return DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Gender"),
            onChanged: (String ? newValue) => {
                setState(() => gender = newValue!)
            },

            value: genderList[genderList.indexOf(oldGender)],
            isExpanded: true,            
            items: genderList.map((String value) {
                return DropdownMenuItem(
                    value: value,
                    child: Text(value),
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
        if (!formKey.currentState!.validate()){
            print("Nahhhh"); 
        }
        else{
            formKey.currentState!.save();
            _updateContact();
            Navigator.pop(context);
        }  
    }
    String _getGender(int gender){
        return gender == 1 ? "Male" : (gender == 2 ? "Female": "Others");
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