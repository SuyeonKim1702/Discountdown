import 'package:discountdown_store/store/store_create_location.dart';
import 'package:discountdown_store/user/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:discountdown_store/ad/ad_create_fcfs.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:discountdown_store/ad/ad_create_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:discountdown_store/ad/ad_create_discount.dart';

//import 'package:storeuser/ad_modify_fcfs.dart';
//import 'package:storeuser/ad_modify_plus.dart';
//import 'ad_modify_discount.dart';

class StoreRead extends StatefulWidget {
  @override
  _StoreReadState createState() => _StoreReadState();
}

class _StoreReadState extends State<StoreRead> with TickerProviderStateMixin {
  void _to_Discount() {
    Navigator.pushNamed(context, AdCreateDiscount.routeName1);
  }

  void initState() {
    super.initState();
    //성별
    store_infos[0].dataMap.putIfAbsent("여성", () => 1);
    store_infos[0].dataMap.putIfAbsent("남성", () => 3);
    //거주지
    store_infos[0].dataMap2.putIfAbsent("서대문구", () => 10);
    store_infos[0].dataMap2.putIfAbsent("종로구", () => 3);
    store_infos[0].dataMap2.putIfAbsent("마포구", () => 1);
    store_infos[0].dataMap2.putIfAbsent("중구", () => 2);
    //연령
    store_infos[0].dataMap3.putIfAbsent("10대", () => 2);
    store_infos[0].dataMap3.putIfAbsent("20대", () => 20);
    store_infos[0].dataMap3.putIfAbsent("30대", () => 10);
    store_infos[0].dataMap3.putIfAbsent("40대", () => 1);

    //성별
    store_infos[1].dataMap.putIfAbsent("여성", () => 3);
    store_infos[1].dataMap.putIfAbsent("남성", () => 1);
    //거주지
    store_infos[1].dataMap2.putIfAbsent("서대문구", () => 10);
    store_infos[1].dataMap2.putIfAbsent("종로구", () => 2);
    store_infos[1].dataMap2.putIfAbsent("마포구", () => 3);
    store_infos[1].dataMap2.putIfAbsent("중구", () => 1);
    //연령
    store_infos[1].dataMap3.putIfAbsent("10대", () => 2);
    store_infos[1].dataMap3.putIfAbsent("20대", () => 20);
    store_infos[1].dataMap3.putIfAbsent("30대", () => 1);
    store_infos[1].dataMap3.putIfAbsent("40대", () => 1);
  }

  String user_name = '사용자1';
  final List<store_info> store_infos = [
    store_info(
        name: "맛있파스타 1호점", customer_age: '2030', sex: '여성', local: "서대문구"),
    store_info(name: "맛있파스타 2호점", customer_age: '30', sex: '남성', local: "서대문구"),
  ];

  int store_index = 0;

  void navigate() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => StoreCreateLocation("수정")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//      new AppBar(title: new Text('광고'), actions: <Widget>[
//        new IconButton(
//            color: Colors.white,
//            icon: Icon(Icons.add),
//            onPressed: () => {_to_Discount()}),
//      ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserAppBar("매장"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  //GridView.extent 나 ListView 등 넣으면, 화면 하얗게 됨
                  children: <Widget>[
                    //                 ButtonBar(children: <Widget>[
                    RaisedButton(
                        onPressed: () => setState(() {
                              store_index = 0;
                            }),
                        child: Text(store_infos[0].name)),
                    RaisedButton(
                        onPressed: () => setState(() {
                              store_index = 1;
                            }),
                        child: Text(store_infos[1].name)),
                    RaisedButton(
                      onPressed: navigate,
                      child: Text('+'),
                    ),
                    //null자리에 페이지 이동 넣기
                    //                 ],),
                  ],
                ),
              ),
            ),
            Column(
                children: <Widget>[
                  Text(store_infos[store_index].name,
                      style: TextStyle(fontSize: 28)),
                  Text('타깃고객층 : ' +
                      store_infos[store_index].customer_age +
                      ' ' +
                      store_infos[store_index].sex +
                      ' ' +
                      store_infos[store_index].local),
                  PieChart(
                    dataMap: store_infos[store_index].dataMap,
                    initialAngle: 4.7,
                    chartRadius: 110,
                    legendFontSize: 14,
                    legendFontColor: Colors.black54,
                    chartValuesColor: Colors.black54,
                  ),
                  PieChart(
                    dataMap: store_infos[store_index].dataMap2,
                    legendFontColor: Colors.black54,
                    chartValuesColor: Colors.black54,
                    initialAngle: 4.7,
                    chartRadius: 110,
                    legendFontSize: 14,
                  ),
                  PieChart(
                    dataMap: store_infos[store_index].dataMap3,
                    initialAngle: 4.7,
                    chartRadius: 110,
                    legendFontSize: 14,
                    legendFontColor: Colors.black54,
                    chartValuesColor: Colors.black54,
                  )
                ],
              ),

          ],
        ),
      ),
    );
  }
}

class store_info {
  String name;
  String customer_age;
  String sex;
  String local;
  Map<String, double> dataMap = new Map();
  Map<String, double> dataMap2 = new Map();
  Map<String, double> dataMap3 = new Map();

  store_info({this.name, this.customer_age, this.sex, this.local});
}
