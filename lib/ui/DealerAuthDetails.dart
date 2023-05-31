import 'package:bidwiser/BWNetwork.dart';
import 'package:bidwiser/EditRepresentativeDetails.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BWSharedPref.dart';

import 'package:sizer/sizer.dart';

import 'model/AuthRepreListResponseData.dart';

class DealerAuthDetails extends StatefulWidget {
  const DealerAuthDetails();

  @override
  _DealerAuthDetailsState createState() => _DealerAuthDetailsState();
}

class _DealerAuthDetailsState extends State<DealerAuthDetails> {

  bool _isFirstLoadRunning = false;

  AuthRepreListResponseDataData userdetail = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstLoad();
  }

  void loadAuthRepresentativeData(List<AuthRepreListResponseDataData> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userid = prefs.getString('userId');
    for(int i = 0 ; i < list.length ; i++) {
      if(userid == list[i].sId) {
        userdetail = list[i];
      }
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    getAuthRepre()
        .then((value) => {
      setState(() {
        _isFirstLoadRunning = false;
      }),
      loadAuthRepresentativeData(value.data)
    })
        .catchError((e) async {
      setState(() {
        _isFirstLoadRunning = false;
      });
      print("Failed to load auth representative " + e.toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int expiry = prefs.get("ExpiresIn");

      int now = DateTime.now().millisecondsSinceEpoch;
      if (now > expiry) {
        doRefreshTokenForFirstPage();
      }
    });
  }

  void doRefreshTokenForFirstPage() {
    setState(() {
      setState(() {
        _isFirstLoadRunning = true;
      });
      refreshAT()
          .then((value) => {
        addAccessTokenToSF(value.AccessToken),
        addExpiresInToSF(value.ExpiresIn),
        _firstLoad()
      })
          .catchError((e) {
        setState(() {
          _isFirstLoadRunning = false;
        });
        print("Failed to refresh token due to " + e.toString());
      });
    });
  }


  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _isFirstLoadRunning
          ? Container(
        child: CircularProgressIndicator(),
        alignment: Alignment.center,
      )
          :
      Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child:ListView(children: <Widget>[
            Card(
                margin: const EdgeInsets.only(
                    right: 0, left: 0, top: 20, bottom: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 25.0,
                                    right: 5.0,
                                    top: 0,
                                    bottom: 0),
                                child:
                                CircularProfileAvatar(
                                  '',
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/loading-image.png',
                                    height: 10.h,
                                    fit: BoxFit.fill,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                        'images/Screenshot.png',
                                        height: 8.h,
                                        fit: BoxFit.fill,
                                      );
                                    },
                                    image: userdetail!=null && userdetail.usersLogo != null
                                        ? getParseUrl(userdetail.usersLogo)
                                        : "",
                                  ),
                                  borderColor: Color(0x66495DB6),
                                  borderWidth: 5,
                                  elevation: 5,
                                  radius: 30,
                                ))
                          ]),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Business Name',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff1F3158),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:userdetail!=null &&  userdetail.busneissTitle != null && userdetail.busneissTitle.isNotEmpty? userdetail.busneissTitle : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Website',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff1F3158),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userdetail!=null && userdetail.website != null && userdetail.website.isNotEmpty? userdetail.website : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Company email address',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff1F3158),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:userdetail!=null && userdetail.emailCompany != null && userdetail.emailCompany.isNotEmpty? userdetail.emailCompany : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Office contact phone number',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userdetail!=null && userdetail.phoneNumber != null && userdetail.phoneNumber.isNotEmpty? userdetail.phoneNumber : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Address',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:userdetail!=null && userdetail.address1 != null && userdetail.address1.isNotEmpty? userdetail.address1 : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'City',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userdetail!=null && userdetail.city != null && userdetail.city.isNotEmpty ? userdetail.city : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'State',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userdetail!=null && userdetail.state != null && userdetail.state.isNotEmpty? userdetail.state : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Zipcode',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: userdetail!=null && userdetail.zip != null && userdetail.zip.isNotEmpty? userdetail.zip : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Main Contact Name',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:userdetail!=null && userdetail.firstName != null && userdetail.firstName.isNotEmpty? userdetail.firstName : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Main Contact Email Address',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:userdetail!=null && userdetail.email != null && userdetail.email.isNotEmpty? userdetail.email : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 10, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffacb3bf),
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Main Contact Mobile / Other',
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ]))),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 0.0, top: 5, bottom: 0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xff2A2F32),
                                      fontFamily: 'BarlowSemiCondensed',
                                      fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:userdetail!=null && userdetail.mobile != null &&  userdetail.mobile.isNotEmpty?  userdetail.mobile : "--",
                                        style: TextStyle(
                                          color: Color(0xff2A2F32),
                                          fontFamily: 'BarlowSemiCondensed',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ))
                                  ]))),
                      Card(
                          color: Color(0xffeff0f4),
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, top: 15, bottom: 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 15, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xffacb3bf),
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Floorplan Company Name',
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 10, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xff2A2F32),
                                                fontFamily: 'BarlowSemiCondensed',
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:userdetail!=null && userdetail.fllorPlanCompanyName != null && userdetail.fllorPlanCompanyName.isNotEmpty? userdetail.fllorPlanCompanyName : "--",
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 15.0,
                                ),

                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 15, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xffacb3bf),
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Floorplan Company Main Contact',
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 10, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xff2A2F32),
                                                fontFamily: 'BarlowSemiCondensed',
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:userdetail!=null && userdetail.floorPlanMainContact != null && userdetail.floorPlanMainContact.isNotEmpty? userdetail.floorPlanMainContact : "--",
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 15.0,
                                ),

                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 15, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xffacb3bf),
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Floorplan Company Main Contact Title',
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 10, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xff2A2F32),
                                                fontFamily: 'BarlowSemiCondensed',
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Sales Manager - Regional Head',
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 15.0,
                                ),

                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 15, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xffacb3bf),
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Floorplan Company Main Contact Mobile/Other',
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 10, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xff2A2F32),
                                                fontFamily: 'BarlowSemiCondensed',
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: userdetail!=null && userdetail.floorPlanContactEmail != null && userdetail.floorPlanContactEmail.isNotEmpty? userdetail.floorPlanContactEmail  : "--",
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 15.0,
                                ),

                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 15, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xffacb3bf),
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Floorplan Company email address',
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, right: 0.0, top: 10, bottom: 0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Color(0xff2A2F32),
                                                fontFamily: 'BarlowSemiCondensed',
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:userdetail!=null && userdetail.floorPlanContactEmail  != null && userdetail.floorPlanContactEmail .isNotEmpty? userdetail.floorPlanContactEmail  : "--",
                                                  style: TextStyle(
                                                    color: Color(0xff2A2F32),
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ))
                                            ]))),
                                SizedBox(
                                  height: 15.0,
                                ),
                              ])),
                      Container(
                          margin: EdgeInsets.only(left: 60, right: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditRepresentativeDetails(userdetail)));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff035F77),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.only(left: 0),
                            ),
                            child: Text("Edit Details",style: TextStyle(
                              color: Color(0xffffffff),
                              fontFamily: 'BarlowSemiCondensed',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            )),
                          )
                      )
                    ])),
            SizedBox(
              height: 150.0,
            ),]))
    ]);
  }


}