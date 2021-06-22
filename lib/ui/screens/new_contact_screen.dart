import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
    const NewContact({Key? key }) : super(key: key);

    @override
    _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
    late String firstName; 
    late String lastName; 
    late String phoneNumber; 
    String gender = ""; 
    late String email; 
    late String address; 

    List<String> genderList = ["Male", "Female", "Others"]; 

    final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 

    Widget firstNameField(){
        return TextFormField(
            decoration: InputDecoration(labelText: "First name"),
            validator: (String ? value) {
                if (value==null || value.isEmpty){
                    return "First name is required"; 
                }
            },
            onSaved: (String ? value) => firstName = value!,
        ); 
    }

    Widget lastNameField(){
        return TextFormField(
            decoration: InputDecoration(labelText: "Last name"),
            validator: (String ? value) {
                if (value==null || value.isEmpty){
                    return "Last name is required"; 
                }
            },
            onSaved: (String ? value) => lastName = value!,
        ); 
    }

    Widget phoneNumberField(){
        return TextFormField(
            decoration: InputDecoration(labelText: "Phone Number"),
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

    Widget genderField(){
        return DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Gender"),
            onChanged: (String ? newValue) => {
                setState(() => gender = newValue!)
            },

            value: genderList[2],
            isExpanded: true,            
            items: genderList.map((String value) {
                return DropdownMenuItem(
                    value: value,
                    child: Text(value),
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
        print(firstName); 
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
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
                                        if (!formKey.currentState!.validate()){
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