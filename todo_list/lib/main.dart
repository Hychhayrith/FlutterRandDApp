import 'package:flutter/material.dart';
import 'package:todo_list/pages.dart';
import './screens/UIUX/UIUX.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandD();
  }
}

class RandD extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [UIUX(), ExplorePage(), PastTripsPage()];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter R & D'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Image.network(
                'https://res.cloudinary.com/dd8plasfr/image/upload/v1575793384/RNRandDAppImage/browser_1_dmluyw.png',
                width: 25,
                height: 25,
              ),
              title: new Text('UI & UX'),
            ),
            BottomNavigationBarItem(
              icon: new Image.network(
                'https://res.cloudinary.com/dd8plasfr/image/upload/v1575793384/RNRandDAppImage/browser_1_dmluyw.png',
                width: 25,
                height: 25,
              ),
              title: new Text('Component'),
            ),
            BottomNavigationBarItem(
              icon: new Image.network(
                'https://res.cloudinary.com/dd8plasfr/image/upload/v1575793384/RNRandDAppImage/browser_1_dmluyw.png',
                width: 25,
                height: 25,
              ),
              title: new Text('Firebase'),
            )
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
