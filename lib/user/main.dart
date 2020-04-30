import 'package:discountdown_store/ad/ad_create_discount.dart';
import 'package:discountdown_store/ad/ad_create_fcfs.dart';
import 'package:discountdown_store/ad/ad_create_plus.dart';
import 'package:discountdown_store/model/store_user.dart';
import 'package:discountdown_store/store/store_create_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

import 'login_page.dart';


//initializeDateFormatting().then((_) =>)
void main() {
  runApp(AdStore());
}

class AdStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      AdCreateFcfs.routeName2: (BuildContext context) => new AdCreateFcfs(),
      AdCreatePlus.routeName3: (BuildContext context) => new AdCreatePlus(),
      AdCreateDiscount.routeName1: (BuildContext context) => new AdCreateDiscount(),
//      fcfs2.routeName2: (BuildContext context) => new fcfs2(),
//      Plus2.routeName3: (BuildContext context) => new Plus2(),
//      Discount2.routeName1: (BuildContext context) => new Discount2(),
    };

    return MaterialApp(
      title: 'disCount Down',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.redAccent,
        secondaryHeaderColor: Colors.amber,

      ),
      home: AdStorePage(),
      routes: routes,
    );
  }
}

//class AdStorePage extends StatefulWidget {
//  @override
//  _AdStorePageState createState() => _AdStorePageState();
//}
//
//class _AdStorePageState extends State<AdStorePage> {
//  Firestore firestore = Firestore.instance;
//  FirebaseAuth auth = FirebaseAuth.instance;
//  GoogleSignIn googleSignIn = GoogleSignIn();
//
//  TextEditingController emailCtrl = TextEditingController();
//  TextEditingController passwordCtrl = TextEditingController();
//
//  BuildContext buildContext;
//
//  Stream getData() {
//    Stream stream = firestore.collection('StoreUsers').snapshots();
//    print(stream);
//    return firestore.collection('StoreUsers').snapshots();
//    //.listen(print);  //users collection에 있는 모든 데이터를 가져옴
//  }
//
//  Stream updateDate(String docId) {
//    Map<String, dynamic> data = Map();
//    data['name'] = 'starbuck';
//    data['age'] = 40;
//
//    //firestore.collection('users').document(docId).setData(data);
//    //firestore.collection('users').add(data);
//    //get.asStream
//    //setData
//  }
//
//  void updateTarget(StoreUser user) {
//    Map<String, dynamic> data = Map();
//    data['target'] = user.target;
//
//    firestore.collection('StoreUsers').document(user.target).updateData(data);
//    //docId로 구분해서 그 안에 있는 age 부름
//  }
//
//  void googleSignUp() async {
//    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    GoogleSignInAuthentication googleSignInAuthentication =
//    await googleSignInAccount.authentication;
//
//    AuthCredential credential = GoogleAuthProvider.getCredential(
//      idToken: googleSignInAuthentication.idToken,
//      accessToken: googleSignInAuthentication.accessToken,
//    );
//    FirebaseUser user = await auth.signInWithCredential(credential);
//
//
//
//    print(user);
//    print(user.uid);
//  }
//
//  void signUp(String email, String password) async {
//    if (email.length < 5) {
//      SnackBar snackBar = SnackBar(content: Text("이메일을 맞게 적어주세요"));
//
//      Scaffold.of(buildContext).showSnackBar(snackBar);
//      return;
//    }
//    auth.onAuthStateChanged.listen((FirebaseUser user) {
//      print(user);
//    });
//    try {
//      FirebaseUser user = await auth.createUserWithEmailAndPassword(
//          email: email, password: password);
//    } catch (error) {
//      PlatformException e = error;
//      print(e.message);
//      print(e.code);
//    }
//
//    Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => StoreCreateLocation()));
//  }
//
//  Stream query() {
//    return firestore
//        .collection('users')
//        .where('age', isLessThan: 42)
//        .where('age', isGreaterThan: 25)
//        .snapshots();
//  }
//
//  void navigate() {
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (context) => StoreCreateLocation()));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Center(
//          child: Container(
//            width: double.infinity,
//            padding: EdgeInsets.only(top: 300),
//            color: Theme.of(context).primaryColor,
//            child: Column(
//              children: <Widget>[
//                Text(
//                  '로그인',
//                  style: TextStyle(fontSize: 20),
//                ),
//                TextField(
//                  controller: emailCtrl,
//                  decoration: InputDecoration(icon: Icon(Icons.email)),
//                ),
//                TextField(
//                  obscureText: true,
//                  controller: passwordCtrl,
//                  decoration: InputDecoration(
//                      icon: Icon(Icons.android), hintText: '비밀번호를 적어주세요(6글자 이상)'),
//                ),
//
//                RaisedButton(
//                  child: Text('구글 로그인'),
//                  onPressed: () {
//                    googleSignUp();
//                    navigate();
//                  }
//                  //googleSignUp,
//                ),
//              ],
//            ),
//          ),
//        ));
//  }
//}
