import 'package:bidwiser/AddVinPage.dart';
import 'package:bidwiser/BWSharedPref.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BWNetwork.dart';
import 'DealerAddCardPage.dart';
import 'DealerDashboardPage.dart';
import 'package:sizer/sizer.dart';

class MySetUserTypePage extends StatefulWidget {
  const MySetUserTypePage();

  @override
  _MySetUserTypePageState createState() => _MySetUserTypePageState();
}

class _MySetUserTypePageState extends State<MySetUserTypePage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var autoValidate = false;
  bool _value = false;
  int val = -1;
  bool visible = false;
  FocusNode myFocusNode = new FocusNode();

  final dealerNoController = TextEditingController();

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
    dealerNoController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            shadowColor: Colors.white,
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
              child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 1.h),
                              child: Text("Select Your Role",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff2A2F32),
                                    fontSize: 30.sp,
                                    fontFamily: 'CormorantGaramond',
                                    fontWeight: FontWeight.w700,
                                  ))),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 50,
                                  margin:  EdgeInsets.only(
                                      left: 7.0.w,
                                      right: 7.0.w,
                                      top: 0,
                                      bottom: 0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: val == 1? Color(0xff17C0CC) : Color(0xffD9E1E2),
                                          spreadRadius: 1),
                                    ],
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Radio(
                                          value: 1,
                                          groupValue: val,
                                          onChanged: (value) {
                                            setState(() {
                                              val = value;
                                            });
                                          },
                                          activeColor: Color(0xff17C0CC),
                                        ),
                                        Text("I want to SELL my vehicle (Private seller)",
                                            style: TextStyle(
                                              color: Color(0xff001441),
                                              fontSize: 11.sp,
                                              fontFamily: 'BarlowSemiCondensed',
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ])),
                              SizedBox(
                                height: 3.0.h,
                              ),
                              Container(
                                  height: 50,
                                  margin:  EdgeInsets.only(
                                      left: 7.w,
                                      right: 7.w,
                                      top: 0,
                                      bottom: 0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: val == 2? Color(0xff17C0CC) : Color(0xffD9E1E2),
                                          spreadRadius: 1),
                                    ],
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Radio(
                                          value: 2,
                                          groupValue: val,
                                          onChanged: (value) {
                                            setState(() {
                                              val = value;
                                            });
                                          },
                                          activeColor: Color(0xff17C0CC),
                                        ),
                                        Text("I want to BUY a vehicle (Dealers only)",
                                            style: TextStyle(
                                              color: Color(0xff001441),
                                              fontSize: 11.sp,
                                              fontFamily: 'BarlowSemiCondensed',
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ])),
                            ],
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          new GestureDetector(
                            onTap: () {
                              if (val == 1) {
                                setSeller();
                              } else if (val == 2) {
                                setDealer();
                              } else {
                                showToast("Please select at least one value");
                              }
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 5.h,
                                      padding: EdgeInsets.all(2.0.w),
                                      child: Center(
                                          child: Text(
                                        "NEXT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w500),
                                      )),
                                      decoration: BoxDecoration(
                                          color: Color(0xff035F77),
                                          borderRadius:
                                              BorderRadius.circular(100.0)),
                                    ))),
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Color(0xff000000),
                                  value: true,
                                  onChanged: (bool nValue) {
                                    setState(() {});
                                  },
                                ),
                                Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontSize: 13.sp),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'I accept the ',
                                                style: TextStyle(
                                                  color: Color(0xff2A2F32),
                                                  fontSize: 13.sp,
                                                  fontFamily: 'BarlowSemiCondensed',
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            TextSpan(
                                                text:
                                                'Terms and Conditions',
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                  color: Color(0xff17C0CC),
                                                  fontSize: 13.sp,
                                                  fontFamily: 'BarlowSemiCondensed',
                                                  fontWeight: FontWeight.w600,
                                                )),

                                          ])),
                                ),
                              ]),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                'images/login-bg-2.png',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
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
    ]);
  }

  void setSeller() {
    setState(() {
      setState(() {
        isLoading = true;
      });
      setSellerUserTypeResponse("bwuser", "")
          .then((value) => {
                addSetUserStatusSF("bwuser"),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AddVinPage()))
              })
          .catchError((e) async {
        setState(() {
          isLoading = false;
        });
        showToast("Failed to set user type due to " + e.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int expiry = prefs.get("ExpiresIn");
        int now = DateTime.now().millisecondsSinceEpoch;
        if (e is CustomException && e.errorCode == 401) {
          doRefreshTokenForSeller();
        }
      });
    });
  }

  void setDealer() {
    hideKeyboard(context);
    setState(() {
      setState(() {
        isLoading = true;
      });
      setUserTypeResponse("bwdealer", dealerNoController.text)
          .then((value) => {
                addSetUserStatusSF("bwdealer"),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => DealerAddCardPage()))
              })
          .catchError((e) async {
        setState(() {
          isLoading = false;
        });
        showToast("Failed to set user type due to " + e.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int expiry = prefs.get("ExpiresIn");
        int now = DateTime.now().millisecondsSinceEpoch;
        if (e is CustomException && e.errorCode == 401) {
          doRefreshTokenForDealer();
        }
      });
    });
  }

  void doRefreshTokenForSeller() {
    setState(() {
      setState(() {
        isLoading = true;
      });
      refreshAT()
          .then((value) => {
                addAccessTokenToSF(value.AccessToken),
                addExpiresInToSF(value.ExpiresIn),
                setSeller()
              })
          .catchError((e) {
        setState(() {
          isLoading = false;
        });
        showToast("Failed to refresh token due to " + e.toString());
        if (e is CustomException && e.errorCode == 401) {
          clearAndPushToStart(context);
        }
      });
    });
  }

  void doRefreshTokenForDealer() {
    setState(() {
      setState(() {
        isLoading = true;
      });
      refreshAT()
          .then((value) => {
                addAccessTokenToSF(value.AccessToken),
                addExpiresInToSF(value.ExpiresIn),
                setDealer()
              })
          .catchError((e) {
        setState(() {
          isLoading = false;
        });
        showToast("Failed to refresh token due to " + e.toString());
        if (e is CustomException && e.errorCode == 401) {
          clearAndPushToStart(context);
        }
      });
    });
  }
}
