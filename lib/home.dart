import 'package:flutter/material.dart';
import 'package:tripsflutterapp/homelayout.dart';
import 'package:tripsflutterapp/searchscreen.dart';
import 'package:tripsflutterapp/style.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TripGo',
          style: appTheme.textTheme.headline5,
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          HomeLayout(),
          _floatingMenu(context),
        ]),
      ),
      drawer: Drawer(
        child: Container(),
      ),
    );
  }

  _floatingMenu(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      left: 30.0,
      right: 30.0,
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: IconButton(icon: Icon(Icons.home), onPressed: () {})),
              Expanded(
                  child:
                      IconButton(icon: Icon(Icons.favorite), onPressed: () {})),
              Expanded(
                  child:
                      IconButton(icon: Icon(Icons.person), onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
