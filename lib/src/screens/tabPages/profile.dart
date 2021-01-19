import 'package:flutter/material.dart';

import '../drawHorizontalLine.dart';

class Profile extends StatefulWidget {
  createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              elevation: 50,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Eustache MENSAH",
                ),
                titlePadding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 5.0),
                background: Image.network(
                  "https://leaders.qa/wp-content/uploads/2018/12/sub_man_business_2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: true,
              child: Container(
                margin: EdgeInsets.only(top: 60.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Entreprise name',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            "https://via.placeholder.com/60",
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'User status',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text('Admin'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        decoration: myDecoration(),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'First and last name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.edit),
                                    ],
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'first and last name',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'First and last name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(Icons.edit),
                                    ],
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'your@email.com',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            child: CustomPaint(painter: DrawHorizontalLine()),
                          ),
                          Container(
                              padding: EdgeInsets.all(10.0), child: Text('*')),
                          CustomPaint(painter: DrawHorizontalLine()),
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Reset password',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  myDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.black38,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }
}
