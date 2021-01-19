import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

//import '../mixins/validationMixin.dart';
import '../screens/accueil.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            companyName(),
            SizedBox(
              height: 20.0,
            ),
            emailCard(),
            passwordCard(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  /*
  * Custom fonction witch return a flutter company name 
  **/
  Widget companyName() {
    return Text(
      'Company Name',
      style: TextStyle(
        color: Colors.white70,
        fontFamily: 'Lora',
        fontSize: 35.0,
      ),
    );
  }

  /*
  * Custom fonction witch return a flutter email card widget
  **/
  Widget emailCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.mail,
          color: Color.fromRGBO(33, 37, 41, 1),
        ),
        title: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'your@example.com',
            border: InputBorder.none,
          ),
          validator: (String value){
            if(!isEmail(value)){
              return 'Please enter a valide email';
            }
            return null;            
          },
          onSaved: (String value) {
            email = value;
          },
        ),
      ),
    );
  }

  /*
  * Custom fonction witch return a flutter password card widget
  **/
  Widget passwordCard() {
    return Card(
      //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 30.0),
      child: ListTile(
        leading: Icon(
          Icons.lock,
          color: Color.fromRGBO(33, 37, 41, 1),
        ),
        title: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter password',
            border: InputBorder.none,
          ),
          validator: (String value){
            if(!isLength(value, 6)){
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          onSaved: (String value) {
            password = value;
          },
        ),
      ),
    );
  }

  /*
  * Custom fonction witch return a flutter button widget
  **/
  Widget submitButton() {
    return RaisedButton(
      color: Color.fromRGBO(15, 15, 15, 1),
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Container(
        width: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('Email $email and password $password is ready to send to API');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueil()),
          );
        }
      },
    );
  }
}
