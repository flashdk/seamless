import 'package:flutter/material.dart';

import '../../models/currentModel.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import '../../menu/detailTicketMenu.dart';

class CurrentDetails extends StatefulWidget {
  final CurrentModel ticketDetails;
  CurrentDetails(this.ticketDetails);

  createState() {
    return CurrentDetailsState(ticketDetails);
  }
}

class CurrentDetailsState extends State<CurrentDetails> {
  int counter = 0;
  CurrentModel ticketDetails;
  CurrentDetailsState(this.ticketDetails);

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
              icon: const Icon(Icons.system_update_alt),
              tooltip: 'Ticket page',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            ),
            PopupMenuButton<String> (
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return DetailTicketMenu.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 290.0,
                    child: Text(
                      ticketDetails.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'Questrial',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(ticketDetails.name.substring(0, 1).toUpperCase()),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      child: Text(ticketDetails.name),
                    ),
                    Text(
                      '01/11/19',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                subtitle: Container(
                  child: Text(ticketDetails.name),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Text(
                  ticketDetails.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> moveToLastScreen() {
    Navigator.pop(context);
    return Future.value(true);
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    moveToLastScreen();
    return true;
  }

  void choiceAction (String choice){
    if(choice == DetailTicketMenu.Settings){
      print('Settings');
    }else if(choice == DetailTicketMenu.Suscribe){
      print('Suscribe');
    }else if(choice == DetailTicketMenu.Singout){
      print('Singout');
    }
  }
}
