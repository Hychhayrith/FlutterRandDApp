import 'package:flutter/material.dart';
import '../TodoList/TodoList.dart';

class UIUX extends StatelessWidget {
  List _screens = [
    [
      "Todo",
      new TodoList(),
      'https://res.cloudinary.com/dd8plasfr/image/upload/v1576160166/FlutterRandD/to-do-list_y6k4ah.png'
    ],
    [
      "YouTube",
      new TodoList(),
      'https://res.cloudinary.com/dd8plasfr/image/upload/v1576160165/FlutterRandD/youtube_1_tos7or.png'
    ],
    [
      "Blog Conent",
      new TodoList(),
      'https://res.cloudinary.com/dd8plasfr/image/upload/v1576160166/FlutterRandD/blogging_f8gngs.png'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return _buildScreenList(context);
  }

  Widget _buildScreenList(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _screens.length,
      itemBuilder: (context, index) {
        if (index < _screens.length) {
          return _buildListItem(index, context);
        }
      },
    );
  }

  Widget _buildScreenItem(int index, BuildContext context) {
    return new ListTile(
      title: new Text(_screens[index][0]),
      onTap: () => Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => _screens[index][1]),
      ),
    );
  }

  void _onCardPressed(BuildContext context, int index) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => _screens[index][1]),
    );
  }

  Widget _buildListItem(int index, BuildContext context) {
    return new Card(
      margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          onTap: () => _onCardPressed(context, index),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.blueAccent)),
            ),
            child: Image.network(
              _screens[index][2],
              height: 25,
              width: 25,
            ),
          ),
          title: new Text(
            _screens[index][0],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blueAccent,
            size: 30,
          ),
        ),
      ),
    );
  }
}
