import 'package:bidwiser/ResetPasswordPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BWNetwork.dart';
import 'BWSharedPref.dart';
import 'MyCreatePwdPage.dart';

class ForgotPasswordEmailPage extends StatefulWidget {

  const ForgotPasswordEmailPage();

  @override
  _ForgotPasswordEmailPageState createState() => _ForgotPasswordEmailPageState();
}

class _ForgotPasswordEmailPageState extends State<ForgotPasswordEmailPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var autoValidate = false;

  bool visible = false;
  FocusNode myFocusNode = new FocusNode();

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
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          appBar:  AppBar(
            leading:GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //  margin: const EdgeInsets.only(right: 75),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color(0xff001441),
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 0, bottom: 0),
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Image.asset(
                          'images/apptoplogo.png',
                          width: MediaQuery.of(context).size.width / 15,
                          height: MediaQuery.of(context).size.width / 15,
                          fit: BoxFit.fill,
                        )),
                  ],
                )),
            title: Container(
                child: Text(
                  "FORGOT PASSWORD",
                  style: TextStyle(
                    color: Color(0xff011341),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Stack(children: <Widget>[
            Container(
              color: Color(0xffEFF0F4),
              child: Container(
                  margin:
                  const EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                  color: Colors.white,
                  child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Center(
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  color: Color(0xff011341),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                          Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10, bottom: 10),
                              child: Text(
                                  "Confirm your email and we'll send the verification code to reset your password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff1F3158),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ))),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                              height: 45,
                              margin: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(color: Colors.black12),
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black45, blurRadius: 1, spreadRadius: 0,),
                                    BoxShadow(color: Colors.white, blurRadius: 10, spreadRadius: 5),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 0.0, top: 0, bottom: 0),
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30.0,
                          ),
                          new GestureDetector(
                            onTap: () {
                              hideKeyboard(context);
                              if(passwordController.text.isEmpty){
                                showToast("Email can not be empty");
                              } else {
                                setState(() {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  emailVerificationForPassword(
                                      passwordController.text)
                                      .then((value) =>
                                  {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ResetPasswordPage(passwordController.text)))
                                  })
                                      .catchError((e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showToast(e.toString());
                                  });
                                });
                              }
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      height: 50,
                                      padding: EdgeInsets.all(15.0),
                                      child: Center(
                                          child: Text(
                                            "CONTINUE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400),
                                          )),
                                      decoration: BoxDecoration(
                                          color: Color(0xff001441),
                                          borderRadius:
                                          BorderRadius.circular(100.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xffACB0BB),
                                                offset: Offset(-2, 3),
                                                blurRadius: 1.0,
                                                spreadRadius: 1.0),
                                            BoxShadow(
                                                color: Color(0xffACB0BB),
                                                offset: Offset(-2, -2),
                                                blurRadius: 1.0,
                                                spreadRadius: 1.0)
                                          ]),
                                    ))),
                          )
                        ],
                      ))),
            ),
            isLoading
                ? Container(
              child: CircularProgressIndicator(),
              alignment: Alignment.center,
            )
                : SizedBox(),
          ])),
      new Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'images/login-bg-2.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ))
    ]);
  }
}