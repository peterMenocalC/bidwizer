import 'package:bidwiser/AddVinPage.dart';
import 'package:bidwiser/DealerAddCardPage.dart';
import 'package:bidwiser/DealerDashboardPage.dart';
import 'package:bidwiser/ForgotPasswordEmailPage.dart';
import 'package:bidwiser/SellerOnBoardingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BWNetwork.dart';
import 'BWSharedPref.dart';
import 'DealerAddRepresentative.dart';
import 'MyCreatePwdPage.dart';
import 'MySetUserTypePage.dart';
import 'MySignUpPage.dart';
import 'dart:convert';

import 'package:sizer/sizer.dart';

class MyLogInPage extends StatefulWidget {
  @override
  _MyLogInPageState createState() => _MyLogInPageState();
}

class _MyLogInPageState extends State<MyLogInPage> {
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
  var token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadToken();
  }

  Future<void> loadToken() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
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
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.5,
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
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            )),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Stack(children: <Widget>[
            Container(
              color: Colors.white,
              child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 1.h,
                                  bottom: 0.h),
                              child: Text("Login",
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
                                      text: 'New to BidWizer.com? ',
                                      style: TextStyle(
                                        color: Color(0xff2A2F32),
                                        fontSize: 12.sp,
                                        fontFamily: 'BarlowSemiCondensed',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                        text: 'Create an Account',
                                        style: TextStyle(
                                          color: Color(0xff17C0CC),
                                          fontSize: 12.sp,
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        MySignUpPage()));
                                          }),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 15.0.w, right: 0.0, top: 0, bottom: 0),
                            child: Text("Email address",
                                style: TextStyle(
                                  color: Color(0xff2A2F32),
                                  fontSize: 10.sp,
                                  fontFamily: 'BarlowSemiCondensed',
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Container(
                            height: 6.h,
                            margin: EdgeInsets.only(
                                left: 8.0.w, right: 8.0.w, top: 0, bottom: 0),
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
                              padding: EdgeInsets.only(
                                  left: 5.0.w, right: 0.0, top: 0, bottom: 0),
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 15.0.w, right: 0.0, top: 0, bottom: 0),
                            child: Text("Password",
                                style: TextStyle(
                                  color: Color(0xff2A2F32),
                                  fontSize: 10.sp,
                                  fontFamily: 'BarlowSemiCondensed',
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Container(
                              height: 6.h,
                              margin: EdgeInsets.only(
                                  left: 8.0.w, right: 8.0.w, top: 0, bottom: 0),
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
                                padding: EdgeInsets.only(
                                    left: 5.0.w, right: 0.0, top: 0, bottom: 0),
                                child: TextField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 12.h,
                          ),
                          new GestureDetector(
                              onTap: () {
                                hideKeyboard(context);
                                if (emailController.text.isEmpty) {
                                  showToast("Email can not be empty");
                                } else if (passwordController.text.isEmpty) {
                                  showToast("Password can not be empty");
                                } else {
                                  setState(() {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    userSignIn(emailController.text,
                                            passwordController.text, token)
                                        .then((value) => {
                                              print(
                                                  'Login response ${value.AccessToken} ${value.ChallengeName} ${value.RefreshToken} ${value.Session}'),
                                              addChallengeNameToSF(
                                                  value.ChallengeName),
                                              addSessionToSF(value.Session),
                                              addLoginStatusSF(true),
                                              addAccessTokenToSF(
                                                  value.AccessToken),
                                              addRefreshTokenToSF(
                                                  value.RefreshToken),
                                              addTokenTypeToSF(value.TokenType),
                                              addExpiresInToSF(value.ExpiresIn),
                                              addIdTokenToSF(value.IdToken),
                                              extractUserDataFromAT(
                                                  value.AccessToken),
                                              addLoginStatusSF(true),
                                              handleNavigationAfterLogin(
                                                  context,
                                                  value.ChallengeName,
                                                  value.Session)
                                            })
                                        .catchError((e) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      print('Login fail ${e}');
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
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0.sp,
                                        fontFamily: 'BarlowSemiCondensed',
                                      ),
                                    )),
                                    decoration: BoxDecoration(
                                      color: Color(0xff035F77),
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                  ))),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            ForgotPasswordEmailPage()));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      padding: EdgeInsets.all(0.0),
                                      child: Center(
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Color(0xff17C0CC),
                                            fontSize: 11.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      )))),
                          SizedBox(
                            height: 5.h,
                          ),
                          new Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                'images/login-bg-2.png',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ))
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

    ]));
  }

  void extractUserDataFromAT(String accessToken) {
    if (accessToken == null) {
      addSetUserStatusSF(null);
      return;
    }
    Map<String, dynamic> dataMap = parseJwt(accessToken);
    String userID = dataMap['username'];
    addUserIdToSF(userID);
    List<dynamic> userGroupJson = dataMap['cognito:groups'];
    List<String> tags = userGroupJson != null ? List.from(userGroupJson) : null;
    if (tags != null && tags.isNotEmpty) {
      if (tags.contains("bwuser")) {
        addSetUserStatusSF("bwuser");
      } else if (tags.contains("bwdealer")) {
        addSetUserStatusSF("bwdealer");
      } else {
        addSetUserStatusSF(REPRESENTATIVE);
      }
    } else {
      addSetUserStatusSF(null);
    }
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}

handleNavigationAfterLogin(
    BuildContext context, String challengeName, String session) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (challengeName == "NEW_PASSWORD_REQUIRED") {
    //Return String
    String userId = prefs.getString('userId');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => MyCreatePwdPage(userId, session, challengeName)));
  } else {
    String userType = prefs.getString('UserType');
    String skip = prefs.getString(SKIP);
    String currentSession = prefs.getString('currentSession');
    if (userType != null) {
      getUserDetails()
          .then((value) => {
                if (value.data.address1.isEmpty ||
                    value.data.city.isEmpty ||
                    value.data.state.isEmpty)
                  {
                    if (userType == "bwdealer" || userType == REPRESENTATIVE)
                      {
                        getSavedCardsOfUser(context)
                      }
                    else if(userType == "bwuser") {
                      if(skip == SKIP || currentSession !=null) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => AddVinPage()))
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => SellerOnBoardingPage()))
                      }
                      }
                  }
                else
                  {
                    if (userType == "bwdealer" || userType == REPRESENTATIVE)
                      {
                        getSavedCardsOfUser(context)
                      }
                    else if(userType == "bwuser") {
                      if(skip == SKIP || currentSession !=null) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => AddVinPage()))
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => SellerOnBoardingPage()))
                      }
                    }
                  }
              })
          .catchError((e) async {});
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MySetUserTypePage()));
    }
  }
}

void getSavedCardsOfUser(BuildContext context)  {
  getSavedCards()
      .then((value) async => {

    if (value.data.isEmpty || value.data == null)
      {

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DealerAddCardPage()))
      }
    else
      {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DealerDashboardPage(0)))
      }
  })
      .catchError((e) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => DealerAddCardPage()));
  });
}
