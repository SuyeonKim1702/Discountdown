import 'dart:io';

import 'package:discountdown_store/ad/ad_create_discount.dart';
import 'package:discountdown_store/ad/ad_read.dart';
import 'package:discountdown_store/store/store_read.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'menu_items.dart';

class UserAppBar extends StatefulWidget {
  final String page;
  UserAppBar(this.page);

  @override
  _UserAppBarState createState() => _UserAppBarState(this.page);
}

class _UserAppBarState extends State<UserAppBar> {
  _UserAppBarState(this.page);
  String page;
  File image;

  String userName= "사용자";

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = image;
    });
  }

  Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = image;
    });
  }
  void _to_Discount(){
    Navigator.pushNamed(context, AdCreateDiscount.routeName1);

  }

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      if (choice == MenuItems.adManger) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AdRead()));
      } else if (choice == MenuItems.storeManger) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StoreRead()));
      }
    }

    void navigator() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AdRead()));
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 90,
                    height: 60,
                    child: FlatButton(
                      child: image == null? Image.asset("assets/user.png"): Image.file(image),
                      onPressed: getGalleryImage,
                    )),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    child: FlatButton(
                      child: Text(
                        '$userName',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => StoreRead()));
                      },
                    )),


            page=="광고"? Container(
                  margin: EdgeInsets.only(left: 100),
                  child:
                      IconButton(icon: Icon(Icons.add),onPressed: _to_Discount,))
                      :
            Container(
              margin: EdgeInsets.only(left: 50),
              child:FlatButton(child: Text('광고 관리하기', style: TextStyle(fontSize: 12),), onPressed: navigator,),)
//                  PopupMenuButton<String>(
//                      onSelected: choiceAction,
//                      itemBuilder: (context) {
//                        return MenuItems.choice.map((String choice) {
//                          return PopupMenuItem<String>(
//                            value: choice,
//                            child: Text(choice),
//                          );
//                        }).toList();
//                      }),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
