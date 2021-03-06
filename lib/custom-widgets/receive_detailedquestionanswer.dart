import 'package:demo_app/custom-widgets/detailed_card.dart';
import 'package:demo_app/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import '../classes/question_answer_data.dart';


class ReceiveDetailedQuestionAnswer extends StatefulWidget {
    final Map<String , String> gen1;

   ReceiveDetailedQuestionAnswer({ Key key, this.gen1 }): super(key: key);
  @override
  _ReceiveDetailedQuestionAnswerState createState() => _ReceiveDetailedQuestionAnswerState();
}

class _ReceiveDetailedQuestionAnswerState extends State<ReceiveDetailedQuestionAnswer> {
  final detailedquestionanswer = QuestionAnswer.detailedquestionanswer;
  


  //contains the questions number and corresponding answer
  Map<String, String> surveyData = {}; 
  Map<int, int> surveyData2 = {};
  int _check = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < detailedquestionanswer.length; i++) {
      if(detailedquestionanswer[i]["type"]=="slider"){
        surveyData2[i]=0;
      }else{
        surveyData[i.toString()] = '';
      }
    }
  }

//for all types of cards
  onAnswerChanged(int index, String value) {
    setState(() {
      surveyData[index.toString()] = value;     //data is stored here
      if(value != ''){
          _check++;
        }
    });
    
    print("Survey data:");
    print(surveyData);    
     
  }

//for all slider type of cards
    onAnswerChanged2(int index, int value) {
      surveyData2[index] = value;     //data is stored here
          _check++;
    
    print("Survey data:");
    print(surveyData2);
  }

/*
  void storedata(){

  // addAll() method
  var combinedMap = {}..addAll(surveyData)..addAll(surveyData2);
  print("combinedMap");
  print(combinedMap);


  }*/

  

 @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
     child: SingleChildScrollView(
        child: Column(
          children: <Widget>[ 

              for (var i = 0; i < detailedquestionanswer.length; i++)

              if(detailedquestionanswer[i]["type"]=="multiple-choice")
                  MultipleChoiceCard(
                    i,
                    onAnswerChanged,
                    detailedquestionanswer[i]["question"],
                    detailedquestionanswer[i]["imgurl"],
                    detailedquestionanswer[i]["answers"],
                    )

                    else if(detailedquestionanswer[i]["type"]=="multiple-choice-image")
                     MultipleChoiceImageCard(
                    i,
                    onAnswerChanged,
                    detailedquestionanswer[i]["question"],
                    detailedquestionanswer[i]["imgurl"],
                    detailedquestionanswer[i]["answers"],
                    )

                   else if(detailedquestionanswer[i]["type"]=="image-choice")
                      ImageChoiceCard(
                    i,
                    onAnswerChanged,
                    detailedquestionanswer[i]["question"],
                   // detailedquestionanswer[i]["imgurl"],
                    detailedquestionanswer[i]["answers"],
                    )

                  else if(detailedquestionanswer[i]["type"]=="slider")
                      SliderCard(
                    i,
                    onAnswerChanged2,
                    detailedquestionanswer[i]["question"],
                    ),

             Container(
             child: RaisedButton(
                child: Text("Next"),
                color: Colors.blue,
                onPressed: () {
                 // Map<dynamic,dynamic> combinedMap = {}..addAll(surveyData)..addAll(surveyData2);
                 // Map<dynamic,dynamic> combinedMap2 = {}..addAll(combinedMap)..addAll(widget.gen1);
                  Map questype = {"multiple-choice" : surveyData, "slider": surveyData2}; 
                  Map quesans = {"detailed" : questype, "general": widget.gen1 };


                  if(_check >= detailedquestionanswer.length){
                    //storedata(); 
                    print("Detailed survey data.......................................");
                    print(questype);

                    print(" Survey Data ...........................");
                    print(quesans);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserDetailScreen(
                      gen2 : quesans,
                    )),
                    );//send survey data to server
                }else{
                     SnackBar(content: Text("Please fill all the fields"));
                   }
                   }),
          ),
          
          ],
        ),
      ),
    );

  }
}

