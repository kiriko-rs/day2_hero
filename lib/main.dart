import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'HeroSample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Hero(
            tag: "マクドナルド",
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/logo.jpg"), fit: BoxFit.fill)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Popup("man", "images/logo.jpg"),
                    ),
                  );
                },
              ),
            ),
          ),
          Hero(
            tag: "ロッテリア",
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/lotteria_logo.jpeg"),
                      fit: BoxFit.fill)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Popup("ロッテリア", "images/lotteria_logo.jpeg"),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Popup extends StatelessWidget {
  final String tag;
  final String imagePath;
  Popup(this.tag, this.imagePath);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Hero(
                tag: tag,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imagePath))),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text("This tag is " + tag),
            ),
          ],
        ),
      ),
    );
  }
}
