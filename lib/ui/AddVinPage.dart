import 'package:bidwiser/BWNetwork.dart';
import 'package:bidwiser/DatabaseHelper.dart';
import 'package:bidwiser/SellerBuyerDashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'BWSharedPref.dart';
import 'InspectionReportDetailsPage.dart';
import 'SellerListingFeePage.dart';
import 'package:sizer/sizer.dart';

class AddVinPage extends StatefulWidget {
  const AddVinPage();

  @override
  _AddVinPageState createState() => _AddVinPageState();
}

class _AddVinPageState extends State<AddVinPage> with WidgetsBindingObserver {
  TextEditingController addVinController = TextEditingController();
  bool isLoading = false;
  List<InspectionStatus> inspectionStatusList = null;
  YoutubePlayerController controller;
  @override
  void initState()  {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    addCurrentSessionToSF(SESSION_List_Your_Vehicle);
    addVIDtoSF("");
    addAuctionIdtoSF("");
    loadData();
    controller = YoutubePlayerController(
      initialVideoId: "Cn_KSauGCUY", //Add videoID.
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: false,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
  }

  void loadData() async {
    setState(() async {
      inspectionStatusList = await DatabaseHelper.getInspectionReportsStatus();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
        // Passing controller to widgets below.
        controller: controller,
        child:WillPopScope(
        onWillPop: _onWillPop,
        child: Stack(children: <Widget>[
        Image.asset(
        "images/seller-onboarding-step-complete-hdpi.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),Scaffold(
            backgroundColor: Colors.transparent,
          appBar:AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text("How To - Car Photos",
                style: TextStyle(
                  color:
                  Color(0xffffffff),
                  fontSize: 18.0.sp,
                  fontFamily:
                  'CormorantGaramond',
                  fontWeight:
                  FontWeight.w500,
                )),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SellerBuyerDashboardPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //  margin: const EdgeInsets.only(right: 75),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Color(0xffffffff),
                        )),
                  ],
                )),
          ),
          body: Stack(children: <Widget>[
            SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.all(0.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Stack(
                            children: [
                              YoutubePlayerIFrame(),
                              Positioned.fill(
                                child: YoutubeValueBuilder(
                                  controller: controller,
                                  builder: (context, value) {
                                    return AnimatedCrossFade(
                                      firstChild: const SizedBox.shrink(),
                                      secondChild: Material(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                YoutubePlayerController.getThumbnail(
                                                  videoId:
                                                  "Cn_KSauGCUY",
                                                  quality: ThumbnailQuality.medium,
                                                ),
                                              ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                      crossFadeState: value.isReady
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                      duration: const Duration(milliseconds: 300),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: Image.asset(
                                    'images/thumbs-up.png',
                                    width: MediaQuery.of(context).size.width / 15,
                                    height: MediaQuery.of(context).size.width / 15,
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                width: 1.h,
                              ),
                              Flexible(
                                  child: Text("OKAY, LET'S GO!",
                                      style: TextStyle(
                                        color:
                                        Color(0xff17C0CC),
                                        fontSize: 25.0.sp,
                                        fontFamily:
                                        'BarlowSemiCondensed',
                                        fontWeight:
                                        FontWeight.w900,
                                      ))),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 6.w),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                      child: Text("1. Prepare your vehicle",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w600,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 8.w),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 1.h,
                                    width: 1.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff17C0CC),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Flexible(
                                      child: Text(
                                          "Clean your vehicle inside and out for best results",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 11.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w400,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 8.w),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 1.h,
                                    width: 1.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff17C0CC),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Flexible(
                                      child: Text(
                                          "Your vehicle should be in a sunny, open location.",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 11.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w400,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 8.w),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 1.h,
                                    width: 1.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff17C0CC),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Flexible(
                                      child: Text(
                                          "Clean the dashboard for odometer photo.",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 11.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w400,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 6.w),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                          "2. Have your vehicle title in your hand",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w600,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 8.w),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 1.h,
                                    width: 1.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff17C0CC),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Flexible(
                                      child: Text(
                                          "A clean title ensures a speedy transaction.",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 11.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w400,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 3.0.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 6.w),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                      child: Text(
                                          "3. Pay your \$50 listing fee to start",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 13.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w600,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 8.w),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 1.h,
                                    width: 1.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff17C0CC),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  Flexible(
                                      child: Text(
                                          "An additional \$100 fee will be applied at auction close.",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 11.0.sp,
                                            fontFamily: 'BarlowSemiCondensed',
                                            fontWeight: FontWeight.w400,
                                          )))
                                ],
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                              width: 30.w,
                              margin: EdgeInsets.only(left: 20.w,right: 20.w),
                              child: ElevatedButton(
                                onPressed: () {
                                  //addVin();
                                  if (controller != null) {
                                    controller.pause();
                                  }
                                  initiateAuction();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff17C0CC),
                                  shadowColor: Color(0xff17C0CC),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  padding: EdgeInsets.only(left: 0),
                                ),
                                child: Text("START NOW",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0.sp,
                                        fontFamily: 'BarlowSemiCondensed',
                                        fontWeight: FontWeight.w500)),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          Center(child:Text("This Bid’s For You",
                              style: TextStyle(
                                color:
                                Color(0xffffffff),
                                fontSize: 25.0.sp,
                                fontFamily:
                                'CormorantGaramond',
                                fontWeight:
                                FontWeight.w900,
                              ))),
                          SizedBox(
                            height: 3.h,
                          ),
                          /*Visibility(
                visible: inspectionStatusList !=null && inspectionStatusList.isNotEmpty,
                child:Container(
                padding: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 0),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: Text(
                  "Pending Reports",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Color(0xff191C1F),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                )// first tab [you can add an icon using the icon property
            )),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: inspectionStatusList !=null? inspectionStatusList.length:0,
              itemBuilder: (BuildContext context, int index) {
                return PendinglistItem(context, index);
              },
            ),*/
                        ]))),
            isLoading
                ? Container(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  )
                : SizedBox()
          ]),
        )])));
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  void initiateAuction() {
    setState(() {
      setState(() {
        isLoading = true;
      });
      initiateAuctionApi()
          .then((value) => {
                setState(() {
                  isLoading = false;
                }),
      if(value.data.id != null && value.data.id.isNotEmpty)
        {
          print('<<< ${value.data.id}'),
          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SellerListingFeePage(
                  value.data.id)))
      }
      else{
        showToast("Please try again")
      }
              })
          .catchError((e) async {
        setState(() {
          isLoading = false;
        });
        print("Initiate failed due to " + e.toString());
        if (e is CustomException && e.errorCode == 401) {
          doRefreshToken();
        }
      });
    });
  }

  void doRefreshToken() {
    setState(() {
      setState(() {
        isLoading = true;
      });
      refreshAT()
          .then((value) => {
                addAccessTokenToSF(value.AccessToken),
                addExpiresInToSF(value.ExpiresIn),
                initiateAuction()
              })
          .catchError((e) {
        setState(() {
          isLoading = false;
        });
        print("Failed to refresh token due to " + e.toString());
        if (e is CustomException && e.errorCode == 401) {
          clearAndPushToStart(context);
        }
      });
    });
  }

  Widget PendinglistItem(BuildContext context, int index) {
    return InkWell(
      child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 0, bottom: 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 20, bottom: 10),
                      child: Text(
                        "Vehicle Id - ${inspectionStatusList[index].vid}",
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Color(0xff191C1F),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 20, bottom: 10),
                      child:
                          Text("Status - ${inspectionStatusList[index].status}",
                              textScaleFactor: 1,
                              style: TextStyle(
                                color: Color(0xff191C1F),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ))),
                ]),
          )),
      onTap: () {
        if (inspectionStatusList[index].status == "Active") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InspectionReportDetailsPage(
                      inspectionStatusList[index].vid)));
        } else {
          showToast("Report is not prepared yet..");
        }
      },
    );
  }
}