import 'package:flutter/material.dart';
import 'custom-widgets/card_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Survey';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            
            CardWidget1(),
            CardWidget2(),
            CardWidget3(),
            CardWidget1(),
            CardWidget2(),
            CardWidget3(),

            
          ],
        ),
      ),
    );
  }
}