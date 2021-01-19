import 'package:flutter/material.dart';

import 'src/mixins/validationMixin.dart';
import 'src/screens/loginScreen.dart';

import 'package:logger/logger.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        //scaffoldBackgroundColor: Colors.lightBlue,
        scaffoldBackgroundColor: Color.fromRGBO(33, 37, 41, 1),
      ),
      home: DefineCompany(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DefineCompany extends StatefulWidget {
  @override
  _DefineCompanyState createState() => _DefineCompanyState();
}

class _DefineCompanyState extends State<DefineCompany> with ValidationMixin {
  final formkey = GlobalKey<FormState>();
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                companyText(),
                companyCode(),
                SizedBox(
                  height: 30.0,
                ),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*
  * Custom fonction witch return a view header text
  **/
  Widget companyText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'C',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lora',
            fontSize: 50.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          'ompany code',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 30.0,
          ),
        )
      ],
    );
  }

  /*
  * Custom fonction witch return a flutter input widget
  **/
  Widget companyCode() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 30.0,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          title: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter code',
              border: InputBorder.none,
            ),
            validator: codeCompanyControls,
            onSaved: (String value) {
              code = value;
            },
          ),
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
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      textColor: Colors.white,
      child: Container(
        width: 120.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Continue',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
      onPressed: () {
        var logger = Logger(
          printer: PrettyPrinter(),
        );

        if (formkey.currentState.validate()) {
          var date = new DateTime.now();
          logger.i("Code $code is use to connect at $date");
          formkey.currentState.save();
          print('Time to post $code to API');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
    );
  }
}
