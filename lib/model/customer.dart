class Customer {
  final int id;
  final String name;
  final String email;
  final double currentBalance;

  Customer(
      {required this.id,
      required this.name,
      required this.email,
      required this.currentBalance});
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'email': email,
      'name':name,
      'currentBalance':currentBalance
    };
  }
  Customer.fromMap(Map data, this.id)
      :
        name = data['name'],
        email = data['email'],
        currentBalance = data['currentBalance'];
}
