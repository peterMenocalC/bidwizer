import 'dart:async';
import 'package:bidwiser/AddVinPage.dart';
import 'package:bidwiser/AuctionDetailPage.dart';
import 'package:bidwiser/BWSharedPref.dart';
import 'package:bidwiser/DatabaseHelper.dart';
import 'package:bidwiser/MySetUserTypePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import 'AuctionListPage.dart';
import 'DealerDashboardPage.dart';
import 'MyStartPage.dart';
import 'PreferenceSavedSearchPage.dart';
import 'SellerBuyerDashboardPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Permission.location.request();
  DatabaseHelper.init();
  Stripe.merchantIdentifier = 'Bidwizer';
  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(
        builder: (context, orientation, deviceType) {
          return OverlaySupport(
              child:MaterialApp(
                builder: (context, child) {
                  return MediaQuery(
                    child: child,
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  );
                },
                home: MyHomePage(),
                debugShowCheckedModeBanner: false,
              ));
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState()  {
    super.initState();
    handleNavigation();
  }

  Future<void> handleNavigation() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    bool loginStatus = prefs.getBool('LoginStatus');
    String challengeName = prefs.getString('challengeName');
    if (loginStatus!=null && loginStatus) {
      String UserType = prefs.getString('UserType');
      if (UserType == null) {
        Timer(
            Duration(seconds: 5),
                () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MySetUserTypePage())));
      } else {
        if(UserType == "bwuser") {
          handleSessionNavigation(context);
        }
        else{
          Timer(
              Duration(seconds: 5),
                  () =>
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => DealerDashboardPage(0))));
        }
      }
    } else {
      Timer(
          Duration(seconds: 5),
              () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyStartPage())));
    }
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
          body: Container(
              margin: EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 10.0.h, bottom: 0),
              alignment: Alignment.topCenter,
              child: Image.asset(
                "images/logo-splash.png",
                height:30.h,
                width: MediaQuery.of(context).size.width,
              )))
    ]);
  }
}
