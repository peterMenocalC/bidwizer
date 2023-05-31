import 'package:bidwiser/MyLogInPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BWNetwork.dart';
import 'BWSharedPref.dart';
import 'MyVerificationPage.dart';
import 'package:sizer/sizer.dart';

class MySignUpPage extends StatefulWidget {
  @override
  _MySignUpPageState createState() => _MySignUpPageState();
}

class _MySignUpPageState extends State<MySignUpPage> {
  bool isLoading = false;
  var autoValidate = false;

  bool visible = false;
  FocusNode myFocusNode = new FocusNode();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.5,
            shadowColor: Colors.white,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
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
              "",
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
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              margin:  EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 2.h, bottom: 0),
                              child: Text("Create Account",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff2A2F32),
                                    fontSize: 30.sp,
                                    fontFamily: 'CormorantGaramond',
                                    fontWeight: FontWeight.w700,
                                  ))),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 0.0, right: 0.0, top: 1.0.h),
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffF8A27F),
                                      fontSize: 13.sp),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: TextStyle(
                                        color: Color(0xff2A2F32),
                                        fontSize: 12.sp,
                                        fontFamily: 'BarlowSemiCondensed',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      style: TextStyle(
                                          color: Color(0xffF8A27F), fontSize: 13.sp),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Login',
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              color: Color(0xff17C0CC),
                                              fontSize: 12.sp,
                                              fontFamily: 'BarlowSemiCondensed',
                                              fontWeight: FontWeight.w700,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            MyLogInPage()));
                                              }),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 50.0, right: 0.0, top: 10, bottom: 0),
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Color(0xffF8A27F),
                                          fontSize: 16),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: 'First name',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                          SizedBox(
                            height: 10.0,
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
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        spreadRadius: 5),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 0.0, top: 0, bottom: 0),
                                child: TextField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  controller: firstNameController,
                                  keyboardType: TextInputType.name,
                                ),
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 0.0, top: 0, bottom: 0),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Color(0xffF8A27F), fontSize: 16),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Last name',
                                      style: TextStyle(
                                        color: Color(0xff2A2F32),
                                        fontFamily: 'BarlowSemiCondensed',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ))
                                ])),
                          ),
                          SizedBox(
                            height: 10.0,
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
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        spreadRadius: 5),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 0.0, top: 0, bottom: 0),
                                child: TextField(
                                  controller: lastNameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 0.0, top: 0, bottom: 0),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Color(0xffF8A27F), fontSize: 16),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Email address',
                                      style: TextStyle(
                                        color: Color(0xff2A2F32),
                                        fontFamily: 'BarlowSemiCondensed',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ))
                                ])),
                          ),
                          SizedBox(
                            height: 10.0,
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
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        spreadRadius: 5),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 0.0, top: 0, bottom: 0),
                                child: TextFormField(
                                  validator: validateEmail,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 0.0, top: 0, bottom: 0),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Color(0xffF8A27F), fontSize: 16),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Mobile number',
                                      style: TextStyle(
                                        color: Color(0xff2A2F32),
                                        fontFamily: 'BarlowSemiCondensed',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ))
                                ])),
                          ),
                          SizedBox(
                            height: 10.0,
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
                                    BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        spreadRadius: 5),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 0.0, top: 0, bottom: 0),
                                child: TextFormField(
                                  validator: validateMobile,
                                  controller: mobileNumberController,
                                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
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
                                if (firstNameController.text.isEmpty) {
                                  showToast("First name can not be empty");
                                } else if (lastNameController.text.isEmpty) {
                                  showToast("Last name can not be empty");
                                } else if (emailController.text.isEmpty) {
                                  showToast("Email can not be empty");
                                } else if (mobileNumberController
                                    .text.isEmpty) {
                                  showToast("Mobile number can not be empty");
                                } else {
                                  setState(() {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    userSignUp(
                                        firstNameController.text,
                                        lastNameController.text,
                                        emailController.text,
                                        mobileNumberController.text)
                                        .then((value) => {
                                      addUserIdToSF(value.userId),
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  MyVerificationPage(
                                                      value.userId)))
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
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: 5.h,
                                    padding: EdgeInsets.all(2.w),
                                    child: Center(
                                        child: Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.0.sp,fontFamily: 'BarlowSemiCondensed',),
                                    )),
                                    decoration: BoxDecoration(
                                        color: Color(0xff035F77),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                    ),
                                  ))),
                          SizedBox(
                            height: 4.0.h,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                'images/login-bg-2.png',
                                fit: BoxFit.fitWidth,
                              ))
                        ],
                      ),
                    )),
            isLoading
                ? Container(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  )
                : SizedBox(),
          ])),
    ]));
  }
}
