import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserStoreLicense extends StatefulWidget {
  @override
  _UserStoreLicenseState createState() => _UserStoreLicenseState();
}

class _UserStoreLicenseState extends State<UserStoreLicense> {
  File _image;
  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          _image == null? Text('사업자 등록증 허위 등록, 도용 적발시 법적 처벌에 처해질 수 있으며 이후 수정 불가함을 알려드립니다.'): Image.file(_image),
          FlatButton(
            child: Text('사업자 등록증 올리기'),
            onPressed: getGalleryImage,
          )
        ],
      ));
  }
}
