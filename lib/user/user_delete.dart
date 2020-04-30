import 'package:flutter/material.dart';

class UserDelete extends StatefulWidget {
  @override
  _UserDeleteState createState() => _UserDeleteState();
}

class _UserDeleteState extends State<UserDelete> {


  TextEditingController contentController = TextEditingController();
  String dropdownValueDelete = "광고 불충분";
  String content ="별로";

  void submitData() {
    content = contentController.text;

    if (content.isEmpty) {
      return;
    }

    Navigator.of(context).pop();  //close the top page
    //context는 제대로 navigate하기 위해 필요한 속성
    //context는 state class의 속성
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Text('탈퇴 사유', style: TextStyle(fontSize: 15),),
        DropdownButton<String>(
          value: dropdownValueDelete,
          onChanged: (String newValue) {
            setState(() {
              dropdownValueDelete = newValue;
            });
          },
          items: <String>[
            '광고 불충분',
            '허위 광고',
            '기타'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child:Text(value),
            );
          }).toList(),
        ),
        TextField(
          enabled: dropdownValueDelete =="기타"? true: false,
          decoration: InputDecoration(labelText: '내용',),
          maxLines: 5,
          controller: contentController,
          onSubmitted: (_) => submitData,
          onChanged: (value) {
            content = value;
          },
        ),
        RaisedButton(child: Text('탈퇴'), onPressed: () {},)
      ],
    );
  }
}
