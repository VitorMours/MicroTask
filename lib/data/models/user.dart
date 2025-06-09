class UserModel {

  // String _name;
  String _email;
  String _password;
  // "Name",
  List<String> fields = ["Email","Password"];

  // Constructor
  // required name
  UserModel({required email, required password}) :
      // this._name = name,
      this._email = email,
      this._password = password;

  // Getters
  // String get name => this._name;
  String get email => this._email;
  String get password => this._password;

  // Setters
  // set name(String name){
  //   _name = name;
  // }
  set email(String email){
    _email = email;
  }
  set password(String password){
    _password = password;
  }



  // Overrided methods
  @override
  String toString(){
    StringBuffer buffer = StringBuffer();
    buffer.write("<");

    for(int iterator = 0; iterator < fields.length; iterator++){
      buffer.write(fields[iterator]);

      if(iterator == fields.length){
        break;
      }

      buffer.write(" ,");
    }

    buffer.write(">");
    return buffer.toString();
  }
}

