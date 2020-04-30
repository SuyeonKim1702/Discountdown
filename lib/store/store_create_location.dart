import 'package:discountdown_store/ad/ad_read.dart';
import 'package:discountdown_store/user/user_create_target.dart';

import 'package:flutter/material.dart';

class StoreCreateLocation extends StatefulWidget {
  StoreCreateLocation(this.save);
  String save;
  @override
  _StoreCreateLocationState createState() => _StoreCreateLocationState(this.save);
}

class _StoreCreateLocationState extends State<StoreCreateLocation> {
  String save;
  final String storeName = "맛있파스타";
  final items = List<String>.generate(100, (i) => "Item $i");

  _StoreCreateLocationState(this.save);
  TextEditingController searchController = TextEditingController();


  void navigate() {

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AdRead()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              '운영하고 계신 매장이 무엇입니까?',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(hintText: "매장 검색"),
                    ),
                  ),
                  FlatButton(
                    child: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => UserCreateTarget()));
                    },
                    child: Container(
                        height: 45.0,
                        decoration: BoxDecoration(
                        ),
                        child: new Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Container(
                                    child: Text(
                                      items[index],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 10),
                                      maxLines: 1,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                },
              ),
            ),

            //ListView(),
          ],
        ),

    );

//
//    Column(
//        children: <Widget>[
//          Text('운영하고 계신 매장이 무엇입니까?'),
//          Row(
//            children: <Widget>[
//              TextField(),
//              FlatButton(
//                child: Icon(Icons.search),
//                onPressed: () {},
//              ),
//            ],
//          ),
//          Container(),
//          Text('$storeName'),
//          RaisedButton(
//            child: Text('다음'),
//            onPressed: () {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => AdRead()));
//            },
//          ),
//        ],
//      );
  }
}
