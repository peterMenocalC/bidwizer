
import 'package:bidwiser/BWNetwork.dart';
import 'package:bidwiser/DealerDashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'BusinessAddDetails.dart';
import 'DealerAuthRepViewPage.dart';
import 'DealerProfileViewPage.dart';

class DealerAddDetails extends StatefulWidget {
  
  
  DealerAddDetails();

  @override
  _DealerAddDetailsState createState() =>
      _DealerAddDetailsState();
}

class _DealerAddDetailsState extends State<DealerAddDetails>
    with SingleTickerProviderStateMixin {
  final Update update = Update();

  TabController _tabController;

  var bottomText = "Dealership Account Information";
  var bottomButton = "NEXT";
  var enabledOtherTab = false;
  var value = 0.5;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
            backgroundColor: Color(0xffeff0f4),
            appBar: AppBar(
              shadowColor: Colors.white,
              elevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    if(_tabController.index == 1){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DealerDashboardPage(4)));
                    } else {
                     showToast("Please fill business details");
                    }
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
                    "Business Details",
                    style: TextStyle(
                      color: Color(0xff011341),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            bottomNavigationBar: BottomAppBar(
              color: Color(0xff035F77),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Color(0xff035F77),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff17C0CC)),
                      value: value,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            bottomText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'BarlowSemiCondensed',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                       Container(
                              margin:
                              EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if(_tabController.index == 1){
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DealerDashboardPage(4)));
                                    } else {
                                        update.callNext();
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff17C0CC),
                                  shadowColor: Color(0xff17C0CC),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  padding: EdgeInsets.only(left: 40, right: 40, top: 0, bottom: 0),
                                ),
                                child: Text(bottomButton,style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0.sp,
                                    fontFamily: 'BarlowSemiCondensed',
                                    fontWeight: FontWeight.w500)),
                              ))
                      ],
                    ),
                  ],
                )),
            body: Scaffold(
              body: Stack(children: <Widget>[
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                                  height: 40,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        //This is for background color
                                        color: Colors.white.withOpacity(0.0),
                                        //This is for bottom border that is needed
                                        border: Border(
                                            bottom: BorderSide(color: Color(0x33035F77), width: 2.sp)),
                                      ),
                                      child: TabBar(
                                        physics: NeverScrollableScrollPhysics(),
                                        onTap: (index){
                                          setState(() {
                                            _tabController.index = enabledOtherTab ? index : 0;
                                            if(index == 0) {
                                              bottomText = "Dealership Account Information";
                                              bottomButton = "NEXT";
                                            } else if(index == 1) {
                                              if(enabledOtherTab){
                                                bottomText = "Reps Account Information";
                                                bottomButton = "FINISH";
                                              }
                                            }

                                          });
                                        },
                                        controller: _tabController,
                                        indicatorWeight:5,
                                        indicator: UnderlineTabIndicator(
                                          borderSide: BorderSide(
                                            color: Color(0xff17C0CC),
                                            width: 2.sp,
                                          ),
                                        ),
                                        indicatorColor: Color(0xff17C0CC),
                                        labelColor: Color(0xff17C0CC),
                                        unselectedLabelColor: Color(0x33035F77),
                                        tabs: [
                                          // first tab [you can add an icon using the icon property]
                                          Tab(
                                              child: Text(
                                                  "Business Details",
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontWeight: FontWeight.w600,
                                                  )
                                              )),

                                          // second tab [you can add an icon using the icon property]
                                          Tab(
                                              child: Text(
                                                  "Add Dealer Representatives",
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontFamily: 'BarlowSemiCondensed',
                                                    fontWeight: FontWeight.w600,
                                                  )
                                              )),
                                        ],
                                      ))),
                              SizedBox(
                                  height: 90.h,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      // first tab bar view widget
                                      BusinessAddDetails(updateUI, update),
                                      // second tab bar view widget
                                      DealerAuthRepViewPage()
                                    ],
                                  ))
                            ])))
              ]),
            )));
  }
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  updateUI() {
    setState(() {
      value = 1;
      bottomText = "Reps Account Information";
      bottomButton = "FINISH";
      enabledOtherTab = true;
      _tabController.index = 1;
    });
  }

}
