import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:seamless_mobile/src/screens/tabPages/currents.dart';
import 'package:seamless_mobile/src/screens/tabPages/dashboard.dart';
import 'package:seamless_mobile/src/screens/tabPages/histories.dart';
import 'package:seamless_mobile/src/screens/tabPages/profile.dart';

//third part package
import 'package:back_button_interceptor/back_button_interceptor.dart';

class Accueil extends StatefulWidget {
  @override
  createState() {
    return AccueilState();
  }
}

class AccueilState extends State<Accueil> {
  DateTime currentBackPressTime;

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

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "exit_warning");
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: getBody());
  }

  Widget getBody() {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //backgroundColor: Colors.white60,
        bottomNavigationBar: Container(
          color: Color.fromRGBO(243, 243, 243, 1),
          child: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.dashboard,
                  color: Color.fromRGBO(33, 37, 41, 1),
                ),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color.fromRGBO(33, 37, 41, 1),
                  ),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.layers,
                  color: Color.fromRGBO(33, 37, 41, 1),
                ),
                child: Text(
                  'Currents',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color.fromRGBO(33, 37, 41, 1),
                  ),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.timeline,
                  color: Color.fromRGBO(33, 37, 41, 1),
                ),
                child: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color.fromRGBO(33, 37, 41, 1),
                  ),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Color.fromRGBO(33, 37, 41, 1),
                ),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color.fromRGBO(33, 37, 41, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Import tab pages
            Dashboard(),
            Currents(),
            Histories(),
            Profile(),
          ],
        ),
      ),
    );
  }
}
