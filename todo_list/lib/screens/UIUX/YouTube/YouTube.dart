import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YouTube extends StatefulWidget {
  @override
  State createState() => _YouTubeState();
}

class _YouTubeState extends State<YouTube> {
  var _onLoading = true;
  var videos;

  _fetchData() async {
    setState(() {
      _onLoading = true;
    });

    final _url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      this.videos = map["videos"];

      setState(() {
        _onLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('YouTube App'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _fetchData();
            },
          )
        ],
      ),
      body: new Container(
        child: _onLoading ? _buildCircularProcess() : _buildVideoList(),
      ),
    );
  }

  Widget _buildCircularProcess() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget _buildVideoList() {
    return new ListView.builder(
      itemCount: this.videos.length,
      itemBuilder: (context, index) {
        if (index < videos.length) {
          return _buildVideoItem(index);
        }
      },
    );
  }

  Widget _buildVideoItem(int index) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(videos[index]['imageUrl']),
              new Container(
                margin: new EdgeInsets.only(top: 8.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new CircleAvatar(
                      maxRadius: 20.0,
                      backgroundImage: NetworkImage(
                          videos[index]["channel"]["profileImageUrl"]),
                    ),
                    _buildVideoInfo(index)
                  ],
                ),
              ),
            ],
          ),
        ),
        new Divider()
      ],
    );
  }

  Widget _buildVideoInfo(int index) {
    return new Container(
      width: MediaQuery.of(context).size.width - 65.0,
      margin: new EdgeInsets.only(left: 8.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            videos[index]['name'],
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 2.0),
          ),
          new Text(
              'Number of views: ' + videos[index]['numberOfViews'].toString())
        ],
      ),
    );
  }
}
