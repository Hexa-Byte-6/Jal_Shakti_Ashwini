import 'package:demo_app/classes/state_district_data.dart';
import 'package:flutter/material.dart';

//Form Screen
class UserDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserDetailScreenState();
  }
}

class UserDetailScreenState extends State<UserDetailScreen> {
  String _name;
  String _savedstate;
  String _saveddistrict;
  StateDistrict stateDistrict = StateDistrict();

  List<String> _states = ["Choose a state"];
  List<String> _district = ["Choose a district"];
  String _selectedState = "Choose a state";
  String _selectedDistrict = "Choose a district";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }


  @override
  void initState() {
    _states = List.from(_states)..addAll(stateDistrict.getStates());
    super.initState();
  }

  Widget _buildDropdown() {
    return Column(
            children: <Widget>[

              DropdownButtonFormField<String>(
                isExpanded: true,
              items: _states.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (value) => _onSelectedState(value),
                value: _selectedState,

                validator: (String value) {
                    if (value == "Choose a state") {
                      return 'Field Required';
                    }

                    return null;
                  },

                onSaved: (String value) {
              _savedstate = value;
              },
              ),

              DropdownButtonFormField<String>(
                isExpanded: true,
                items: _district.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                // onChanged: (value) => print(value),
                onChanged: (value) => _onSelectedDistrict(value),
                value: _selectedDistrict,
                validator: (String value) {
                  if(value == "Choose a district"){
                    return "Field required";
                  }
                    return null;
                  },
                onSaved: (String value) {
                  _saveddistrict = value;
                },
              ),
            ],
    );
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedDistrict = "Choose a district";
      _district = ["Choose a district"];
      _selectedState = value;
      _district = List.from(_district)..addAll(stateDistrict.getLocalByState(value));
    });
  }

  void _onSelectedDistrict(String value) {
    setState(() => _selectedDistrict = value);
  }


/////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        body:   Padding(
            padding: new EdgeInsets.all(25.0),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        
          Text("Now a few last steps to help us understand and categorize the survey data. Please fill in the details below",
            style: TextStyle(fontSize: 16),),
      
          Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildName(),
              SizedBox(height: 10),
            _buildDropdown(),
            SizedBox(height: 20),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print("Name  : "+_name);
                  print("State  : "+_savedstate);
                  print("District :  "+_saveddistrict);

                  //Send the data to server
                },
              )
            ],
          ),
      ),
    
          
          ],
      ),
        ),
      
    );
        
        
  }
}
