import 'package:flutter/material.dart';

//Slider 0-10
class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
   int _value = 6;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '0'
                  ),
                  new Expanded(
                    child: Slider(
                        value: _value.toDouble(),
                        min: 1.0,
                        max: 10.0,
                        divisions: 10,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.black,
                        label: 'Set a value',
                        onChanged: (double newValue) {
                          setState(() {
                            _value = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    )
                  ),
                  Text(
                    '10'
                  ),
                ]
              )
            ),
          );
  }
}

//-------------------------------------   Slider 0-10   -------------------------------------------------


//Yes-No Radio Button
enum answer1 {yes , no}

class RadioWidget1 extends StatefulWidget {
  RadioWidget1({Key key}) : super(key: key);
  @override
  _RadioWidget1State createState() => _RadioWidget1State();

}

class _RadioWidget1State extends State<RadioWidget1> {
  
  answer1 markedans1; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Yes'),
          leading: Radio(
            value: answer1.yes,
            groupValue: markedans1,
            onChanged: (answer1 value) {
              setState(() {
                markedans1 = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('No'),
          leading: Radio(
            value: answer1.no,
            groupValue: markedans1,
            onChanged: (answer1 value) {
              setState(() {
                markedans1 = value;

              });
            },
          ),
        ),
      ],
    );
  }
}


//--------------------------------    Yes-No Radio Button   ------------------------------------


//Multiple-choice Radio Button
enum answer2 {ans1 , ans2 , ans3 , ans4 }

class RadioWidget2 extends StatefulWidget {
  RadioWidget2({Key key}) : super(key: key);
  @override
  _RadioWidget2State createState() => _RadioWidget2State();
}

class _RadioWidget2State extends State<RadioWidget2> {
  answer2 markedans2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Agricultural purposes'),
          leading: Radio(
            value: answer2.ans1,
            groupValue: markedans2,
            onChanged: (answer2 value) {
              setState(() {
                markedans2 = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Industrial purposes'),
          leading: Radio(
            value: answer2.ans2,
            groupValue: markedans2,
            onChanged: (answer2 value) {
              setState(() {
                markedans2 = value;

              });
            },
          ),
        ),
        ListTile(
          title: const Text('River-bank protection'),
          leading: Radio(
            value: answer2.ans3,
            groupValue: markedans2,
            onChanged: (answer2 value) {
              setState(() {
                markedans2 = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Other water flowing structures'),
          leading: Radio(
            value: answer2.ans4,
            groupValue: markedans2,
            onChanged: (answer2 value) {
              setState(() {
                markedans2 = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

//--------------------------------    Multiple-choice Radio Button   ----------------------------------