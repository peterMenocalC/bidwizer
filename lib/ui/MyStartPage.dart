import 'package:bidwiser/NewAuctionDetailPage.dart';
import 'package:flutter/material.dart';
import 'MyLogInPage.dart';
import 'MySignUpPage.dart';import 'package:sizer/sizer.dart';

class MyStartPage extends StatefulWidget {
  @override
  _MyStartPageState createState() => _MyStartPageState();
}

class _MyStartPageState extends State<MyStartPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var autoValidate = false;

  bool visible = false;
  FocusNode myFocusNode = new FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    passwordController.dispose();
    emailController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/splash_screen.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Stack(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0, bottom: 0),
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "images/logo-splash.png",
                      height: 30.h,
                      width: MediaQuery.of(context).size.width,
                    )),
                SizedBox(
                  height: 5.0.h,
                ),
                Container(
                    margin:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySignUpPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff17C0CC),
                        shadowColor: Color(0xff707070),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      child: Text(
                        "CREATE AN ACCOUNT",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 12.0.sp,
                          fontFamily: 'BarlowSemiCondensed',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    margin:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyLogInPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff17C0CC),
                        shadowColor: Color(0xff707070),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 12.0.sp,
                          fontFamily: 'BarlowSemiCondensed',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),

                SizedBox(
                  height: 20.0,
                ),
                /*Container(
                    margin:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewAuctionDetailPage(
                                    "625414f2e9805a66e6d1dff0","d408ac27-8d04-47d0-b2c1-b1c5c9a49219","Dealer",false,false)));
                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF9C935),
                        shadowColor: Color(0xff707070),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      child: Text(
                        "CONTINUE AS GUEST",
                        style: TextStyle(
                          color: Color(0xff001441),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),*/
              ],
            ),
            isLoading
                ? Container(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  )
                : SizedBox(),
          ])),
    ]);
  }
}
