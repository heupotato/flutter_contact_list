class Contact{
    int id;
    String firstName; 
    String lastName; 
    String phoneNumber;
    String gender; 
    String email; 
    String address; 
    Contact({required this.id, required this.firstName, required this.lastName, required this.phoneNumber, 
            this.address = "", this.email =" ", this.gender = "Other"}); 

    @override 
    String toString() {
        return("id: $id\nFirst name: $firstName\nLast name: $lastName\nTel: $phoneNumber"); 
  }
}
class MockContact{
    static List<Contact> mockList() => 
        List.generate(10, (int index) => Contact(id: index, firstName: "First ", lastName: "Last", phoneNumber: "0123456789")); 
    static Contact mockContact(int index) => Contact(id: index, firstName: "First ${index.toString()}", lastName: "Last", phoneNumber: "0123456789",
                                                    address: "Nowhere", email: "mail@gmail.com", gender: "Male"); 
}