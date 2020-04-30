import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discountdown_store/model/store_user.dart';
import 'package:discountdown_store/user/user_create_target.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdStorePage extends StatelessWidget {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  BuildContext buildContext;

  Stream getData() {
    Stream stream = firestore.collection('users').snapshots();
    print(stream);
    return firestore.collection('users').snapshots();
    //.listen(print);  //users collection에 있는 모든 데이터를 가져옴
  }

  Stream updateDate(String docId) {
    Map<String, dynamic> data = Map();
    data['name'] = 'starbuck';
    data['age'] = 40;

    //firestore.collection('users').document(docId).setData(data);
    //firestore.collection('users').add(data);
    //get.asStream
    //setData
  }

  void updateTarget(StoreUser user) {
    Map<String, dynamic> data = Map();
    data['target'] = user.target;

    firestore.collection('StoreUsers').document(user.target).updateData(data);
    //docId로 구분해서 그 안에 있는 age 부름
  }

  Future<bool> googleSignUp() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    FirebaseUser user = await auth.signInWithCredential(credential);

    if (user.uid.isNotEmpty) {
      return true;
    } else
      return false;
  }

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
//  }

  Stream query() {
    return firestore
        .collection('users')
        .where('age', isLessThan: 42)
        .where('age', isGreaterThan: 25)
        .snapshots();
  }

  void navigate() {
//        Navigator.of(context).push(
//            MaterialPageRoute(builder: (context) => UserCreateResidence("저장")));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/logo.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text("disCount\nDown",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 10,
          ),
          Positioned(
            right: 110,
            bottom: 100,
            child: Container(
              height: 70,
              width: 70,
              child: IconButton(
                  icon: Image.asset(
                    'assets/google_logo_app.png',
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {
                    googleSignUp();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserCreateTarget()));
                  }
                  //googleSignUp,
                  ),
            ),
          ),
          Positioned(
            right: 180,
            bottom: 100,
            child: Container(
              height: 70,
              width: 70,
              child: IconButton(
                  icon: Image.asset(
                    'assets/kakao_logo_c.png',
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {
                    googleSignUp();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserCreateTarget()));
                  }
                  //googleSignUp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
