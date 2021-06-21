class Contact{
    int id;
    String firstName; 
    String lastName; 
    String phoneNumber;

    Contact({required this.id, required this.firstName, required this.lastName, required this.phoneNumber}); 

    @override 
    String toString() {
        return("id: $id\nFirst name: $firstName\nLast name: $lastName\nTel: $phoneNumber"); 
  }
}
class MockContact{
    static List<Contact> mocks() => 
        List.generate(10, (int index) => Contact(id: index, firstName: "First ", lastName: "Last", phoneNumber: "0123456789")); 
}