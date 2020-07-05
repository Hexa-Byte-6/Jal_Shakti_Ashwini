import 'package:flutter/material.dart';
import './card_components.dart';


//  Yes-No Type Card 
class CardWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              title: Text('Q1. Is there any crack on the embankment?'),
              contentPadding: EdgeInsets.all(10.0),
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/images/cracks.jpg'),
                RadioWidget1(),          //Yes-No Radio Button
              ],
            ),
          ],
        ),
      );
  }
}

//  Slider Type Card
class CardWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              title: Text('Q2. Are there any cracks on either surfaces of the embankment? If yes, how dangerous do you think they are? '),
              contentPadding: EdgeInsets.all(10.0),
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/images/cracks.jpg' , fit: BoxFit.contain),
                SliderWidget(),         //Slider 0-10
              ],
            ),
          ],
        ),
      );
  }
}

//  Multiple-Choice Type Card
class CardWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              title: Text('Q3.  Other than embankments, are there any other structures built along the river for following purposes?'),
              contentPadding: EdgeInsets.all(10.0),
            ),
            Column(
              children: <Widget>[
                RadioWidget2(),         //Multiple-choice Radio Button
              ],
            ),
          ],
        ),
      );
  }
}
