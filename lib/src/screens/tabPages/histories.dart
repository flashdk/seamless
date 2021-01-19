import 'package:flutter/material.dart';

import '../createTicket.dart';

class Histories extends StatefulWidget {
  createState() {
    return HistoriesState();
  }
}

class HistoriesState extends State<Histories> {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 37, 41, 1),
        title: Text('Histories tickets'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Ticket page',
            onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => CreateTicket()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('the histories'),
      ),
    );
  }
}
