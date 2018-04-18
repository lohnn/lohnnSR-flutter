import 'package:flutter/material.dart';

class MainScene extends StatelessWidget {
  final WidgetBuilder body;

  MainScene(this.body);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Lohnn SR"),
        ),
        body: body(context),
      ),
    );
  }
}
