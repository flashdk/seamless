import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:seamless_mobile/src/models/currentModel.dart';
import 'package:seamless_mobile/src/screens/detailPages/currentDetails.dart';

import '../createTicket.dart';

class Currents extends StatefulWidget {
  createState() {
    return CurrentsState();
  }
}

class CurrentsState extends State<Currents> {
  var i = 2;

  Future<List<CurrentModel>> _getCurrentTicket() async {
    var data = await http.get('https://jsonplaceholder.typicode.com/comments');
    var jsonData = json.decode(data.body);

    List<CurrentModel> currentTickets = [];

    for (var t in jsonData) {
      CurrentModel currentTicket = CurrentModel(t["id"], t["name"], t["email"], t["body"]);
      currentTickets.add(currentTicket);
    }
    print(currentTickets.length);
    return currentTickets;
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        title: Text('Currents tickets'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Ticket page',
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => CreateTicket()));
              },
            ),
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: _getCurrentTicket(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  //child: Text("Loading..."),
                  child: Image.asset('images/loading.gif', width: 32.0, height: 32.0),
                ),
              );
            } else {
              Orientation orientation = MediaQuery.of(context).orientation;

              if(orientation == Orientation.portrait){
              return  ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  CurrentModel currentTicket = snapshot.data[index];
                  String name, email; 

                  //get an extra from name an email text comming from api
                  (currentTicket.name.length < 20) ? name = currentTicket.name : name = currentTicket.name.substring(0,20) +'...';
                  (currentTicket.email.length < 26) ? email = currentTicket.email : email = currentTicket.email.substring(0,26) +'...';

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(currentTicket.name.substring(0, 1).toUpperCase()),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(name),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(email),
                          Icon(Icons.star_border),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CurrentDetails(currentTicket),
                        ),
                      );
                    },
                  );
                },
              );

              }
              else{
                return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  CurrentModel currentTicket = snapshot.data[index];
                  String name, email; 

                  //get an extra from name an email text comming from api
                  (currentTicket.name.length < 55) ? name = currentTicket.name : name = currentTicket.name.substring(0,55) +'...';
                  (currentTicket.email.length < 55) ? email = currentTicket.email : email = currentTicket.email.substring(0,55) +'...';

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(currentTicket.name.substring(0, 1).toUpperCase()),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(name),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(email),
                          Icon(Icons.star_border),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CurrentDetails(currentTicket),
                        ),
                      );
                    },
                  );
                },
              );                 
              }
              
            }
          },
        ),
      ),
    );
  }
}
