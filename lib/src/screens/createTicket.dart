import 'package:flutter/material.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';

class CreateTicket extends StatefulWidget {
  createState() {
    return CreateTicketState();
  }
}

class CreateTicketState extends State<CreateTicket> {
  int counter = 0;

  final formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: moveToLastScreen,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(33, 37, 41, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.attachment),
              tooltip: 'Attachment',
              onPressed: () {
                print("object");
              },
            ),
            IconButton(
              icon: const Icon(Icons.send),
              tooltip: 'Send',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'Show more',
              onPressed: () {},
            ),
          ],
          title: Text('New ticket'),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  sender(),
                  reciver(),
                  messageObject(),
                  message(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    moveToLastScreen();
    return true;
  }

  Future<bool> moveToLastScreen() {
    Navigator.pop(context);
    return Future.value(true);
  }

  Widget sender() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('De    '),
          Flexible(
            child: TextFormField(
              readOnly: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'your@example.com',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reciver() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('A    '),
          Flexible(
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'your@example.com',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageObject() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Object',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget message() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: TextField(        
        maxLines: 15,
        scrollPadding: EdgeInsets.all(10.0) ,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Write your message',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
