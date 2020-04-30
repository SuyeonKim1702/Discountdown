import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/src/material/date_picker.dart';
import 'package:intl/intl.dart';

import 'ad_create_discount.dart';
import 'ad_create_plus.dart';

class AdCreateFcfs extends StatefulWidget {
  AdCreateFcfs({Key key, this.title}) : super(key: key);

  static const String routeName2 = "/fcfs";

  final String title;
  @override
  _AdCreateFcfsState createState() => _AdCreateFcfsState();
}

class _AdCreateFcfsState extends State<AdCreateFcfs> {
  void _to_Discount() {
    Navigator.pushNamed(context, AdCreateDiscount.routeName1);
  }

  void _to_Plus() {
    Navigator.pushNamed(context, AdCreatePlus.routeName3);
  }

  File _image;

  getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  String _currentTime1 = '00:00';
  String _currentTime2 = '00:00';
  DateTime _dateTime1 = new DateTime.now();
  DateTime _dateTime2 = new DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final TimeOfDayFormat timeFormat = TimeOfDayFormat.H_colon_mm;

  var dropdownValueDcType = "선착순";
  var dropdownValueStore = "맛있파스타 1호점";
  var dropdownValuerepeat = "매일";
  var dropdownValueMinute = "1분";
  var dropdownValuePercent = "0%";
  TextEditingController _tec = TextEditingController();
  TextEditingController _tec2 = TextEditingController();
  TextEditingController _tec3 = TextEditingController();
  TextEditingController _tec4 = TextEditingController();
  TextEditingController _tec5 = TextEditingController();
  TextEditingController _tec6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('광고'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    DropdownButton<String>(
                      value: dropdownValueDcType,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValueDcType = newValue;

                          switch (dropdownValueDcType) {
                            case '1+1':
                              _to_Plus();
                              break;
                            case '할인율다운':
                              _to_Discount();
                              break;
                          }
                        });
                      },
                      items: <String>['할인율다운', '1+1', '선착순']
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
                  children: <Widget>[
                    DropdownButton<String>(
                      value: dropdownValueStore,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValueStore = newValue;
                        });
                        Navigator.pop(context);
                      },
                      items: <String>['맛있파스타 1호점', '맛있파스타 2호점', '맛있파스타 3호점']
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
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            border:
                            Border.all(width: 1, color: Colors.black12)),
                        margin: EdgeInsets.only(right: 20, top: 20),
                        child: TextField(
                          controller: _tec,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '메뉴이름',
                              hintStyle: TextStyle(color: Colors.grey[300])),
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            border:
                            Border.all(width: 1, color: Colors.black12)),
                        margin: EdgeInsets.only(right: 20, top: 20),
                        child: TextField(
                          controller: _tec2,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '가격',
                              hintStyle: TextStyle(color: Colors.grey[300])),
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  child: _image == null
                      ? Image.asset('assets/photo_icon.png')
                      : Image.file(_image),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        margin: EdgeInsets.only(
                            left: 40, right: 40, top: 20, bottom: 20),
                        child: FloatingActionButton.extended(
                          heroTag: "btn1",
                          elevation: 0.0,
                          label: Text("사진찍기"),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          onPressed: getCameraImage,
                          icon: Icon(Icons.photo_camera),
                        ),
                      ),
                      Container(
                          height: 40.0,
                          width: 40.0,
                          margin: EdgeInsets.only(
                              left: 40, right: 40, top: 20, bottom: 20),
                          child: FloatingActionButton.extended(
                            heroTag: "btn2",
                            elevation: 0.0,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.transparent,
                            label: const Text("갤러리에서 가져오기"),
                            onPressed: getGalleryImage,

                            icon: const Icon(Icons.photo_library), //아이콘
                          )),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Builder(
                        builder: (con1) => RaisedButton(
                          color: Colors.white,
                          child: Text(
                            dateFormat.format(_dateTime1),
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () => showDatePicker(
                            context: con1,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2050),
                          ).then((date) {
                            setState(() {
                              _dateTime1 =
                                  DateTime(date.year, date.month, date.day);
                            });
                          }),
                        ),
                      ),
                      Text(
                        '~',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Builder(
                        builder: (con2) => RaisedButton(
                          color: Colors.white,
                          child: Text(
                            dateFormat.format(_dateTime2),
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () => showDatePicker(
                            context: con2,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2050),
                          ).then((date) {
                            setState(() {
                              _dateTime2 =
                                  DateTime(date.year, date.month, date.day);
                            });
                          }),
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Builder(
                        builder: (con3) => RaisedButton(
                          color: Colors.white,
                          child: Text(
                            '$_currentTime1',
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () => showTimePicker(
                              context: con3, initialTime: TimeOfDay.now())
                              .then((time) {
                            setState(() {
                              _currentTime1 = '${time.hour} : ${time.minute}';
                            });
                          }),
                        ),
                      ),
                      Text(
                        '~',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Builder(
                        builder: (con3) => RaisedButton(
                          color: Colors.white,
                          child: Text(
                            '$_currentTime2',
                            style: new TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () => showTimePicker(
                              context: con3, initialTime: TimeOfDay.now())
                              .then((time) {
                            setState(() {
                              _currentTime2 = '${time.hour} : ${time.minute}';
                            });
                          }),
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '반복주기 :',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValuerepeat,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValuerepeat = newValue;
                          });
                        },
                        items: <String>['매일', '이틀마다', '일주일마다']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '선착순 : ',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 30.0,
                        height: 35,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            border:
                            Border.all(width: 1, color: Colors.black12)),
                        margin: EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: _tec6,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '50',
                              hintStyle: TextStyle(color: Colors.black)),
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ),
                    Text(
                      '명',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                          color: Colors.white,
                          child: Text(
                            '취소',
                            style: new TextStyle(
                              color: Colors.blue[300],
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () => {}),
                      RaisedButton(
                          color: Colors.blue[300],
                          child: Text(
                            '저장',
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () => {}),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
