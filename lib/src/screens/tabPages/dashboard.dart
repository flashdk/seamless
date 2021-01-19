import 'package:flutter/material.dart';

import '../createTicket.dart';

class Dashboard extends StatefulWidget {
  createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  Future<bool> _onWillPop() {
    print("hello every body");
    return Future.value(true);
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(33, 37, 41, 1),
          title: Text('Dashboard'),
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
        body: Center(
          child: Text('define a dashboard'),
        ),
      ),
    );
  }
}
