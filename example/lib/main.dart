import 'package:flutter/material.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:network_image_to_byte/network_image_to_byte.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = 'hidden';

  @override
  void initState() {
    super.initState();

    MediaNotification.setListener('pause', () {
      setState(() => status = 'pause');
    });

    MediaNotification.setListener('play', () {
      setState(() => status = 'play');
    });

    MediaNotification.setListener('next', () {});

    MediaNotification.setListener('prev', () {});

    MediaNotification.setListener('select', () {});
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
            child: Container(
          height: 250.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  child: Text('Show notification'),
                  onPressed: () async {
                    MediaNotification.showNotification(
                      title: 'Title',
                      author: 'Song author',
                      cover: await networkImageToByte(
                          'https://y.gtimg.cn/music/photo_new/T002R90x90M000001NvtHt3hFmxE.jpg?max_age=2592000'),
                    );
                    setState(() => status = 'play');
                  }),
              FlatButton(
                  child: Text('Update notification'),
                  onPressed: () async {
                    MediaNotification.showNotification(
                        title: 'New Title',
                        author: 'New Song author',
                        cover: await networkImageToByte(
                            'https://y.gtimg.cn/music/photo_new/T002R90x90M000001NvtHt3hFmxE.jpg?max_age=2592000'),
                        isPlaying: false);
                    setState(() => status = 'pause');
                  }),
              FlatButton(
                  child: Text('Hide notification'),
                  onPressed: () {
                    MediaNotification.hideNotification();
                    setState(() => status = 'hidden');
                  }),
              Text('Status: ' + status)
            ],
          ),
        )),
      ),
    );
  }
}
