library wheel_spinner;

import 'package:discountdown_store/ad/ad_read.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';


class UserCreateTarget extends StatefulWidget {
  @override
  _UserCreateTargetState createState() => _UserCreateTargetState();
}

class _UserCreateTargetState extends State<UserCreateTarget> {
  var dropdownValueAge = "10대";
  var dropdownValueCity = "서울특별시";
  var dropdownValueLocal = "동작구";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

                Text('타깃 고객층은 어디입니까?', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only( top: 2.0),
                    child: Text(
                      "성별",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ),
                  RadioButtonGroup(
                    labels: [
                      "남",
                      "여",
                    ],

                    onChange: (String label, int index) =>
                        print("label: $label index: $index"),
                    onSelected: (String label) => print(label),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('연령대',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                  Padding(padding: EdgeInsets.only(left: 20),),
                  DropdownButton<String>(
                    value: dropdownValueAge,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueAge = newValue;
                      });
                    },
                    items: <String>['10대', '20대', '30대', '40대', '50대', '60대이상']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('위치',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
                  Padding(padding: EdgeInsets.only(left: 20),),
                  Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: dropdownValueCity,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueCity = newValue;
                          });
                        },
                        items: <String>[
                          '서울특별시',
//                          '부산광역시',
//                          '인천광역시',
//                          '광주광역시',
//                          '대구광역시',
//                          '대전광역시',
//                          '을산광역시'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueLocal,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValueLocal = newValue;
                          });
                        },
                        items: <String>['강남구','강동구','강서구','강북구','관악구','광진구','구로구','금천구','노원구',
                          '동대문구','도봉구','동작구','마포구','서대문구','성동구','성북구','서초구','송파구','영등포구','용산구',
                          '양천구', '은평구','종로구','중구','중랑구']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('이전'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('저장'),
                    onPressed: () {
                      Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => AdRead()));},
                  ),
                ],
              )
            ],
          ),


    );
  }
}
