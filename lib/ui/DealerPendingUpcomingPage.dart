import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class DealerPendingUpcomingPage extends StatefulWidget {
  const DealerPendingUpcomingPage();

  @override
  _DealerPendingUpcomingPageState createState() => _DealerPendingUpcomingPageState();
}

class _DealerPendingUpcomingPageState extends State<DealerPendingUpcomingPage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: NeverScrollableScrollPhysics(),
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 0),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        // give the indicator a decoration (color and border radius)
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          color: Color(0xffF9C935),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xff050056),
                        tabs: [
                          // first tab [you can add an icon using the icon property]
                          Tab(
                            text: 'PENDING DEALS',
                          ),

                          // second tab [you can add an icon using the icon property]
                          Tab(
                            text: 'UPCOMING AUCTIONS',
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // first tab bar view widget
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return PendinglistItem(context, index);
                            },
                          ),

                          // second tab bar view widget
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return WatchlistItem(context, index);
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10.0,
                  )
                ])));
  }
  Widget PendinglistItem(BuildContext context, int index) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          margin:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 0, bottom: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.middle,
                        columnWidths: const <int, TableColumnWidth>{
                          0: IntrinsicColumnWidth(),
                          1: IntrinsicColumnWidth(),
                          2: FixedColumnWidth(64),
                        },
                        // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                        // border:TableBorder.all(width: 2.0,color: Colors.red),
                        children: [
                          TableRow(children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: 0, bottom: 10),
                                child: Text(
                                  "VEHICLE NAME",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    color: Color(0xff191C1F),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: 0, bottom: 10),
                                child: Text("COLOR",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: Color(0xff191C1F),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ))),
                          ]),
                          TableRow(children: [
                            Text("Ford Explorer",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("Red",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: 20, bottom: 10),
                                child: Text(
                                  "MILES",
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
                                child: Text("VIN",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: Color(0xff191C1F),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ))),
                          ]),
                          TableRow(children: [
                            Text("20,525",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("1234EF64JF",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: 20, bottom: 10),
                                child: Text(
                                  "DEAL AMOUNT",
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
                                child: Text("TITLE",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: Color(0xff191C1F),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ))),
                          ]),
                          TableRow(children: [
                            Text("\$20,525",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("Yes",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: 20, bottom: 10),
                                child: Text(
                                  "SHIPMENT STATUS",
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
                                child: Text("",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: Color(0xff191C1F),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ))),
                          ]),
                          TableRow(children: [
                            Text("20,525",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  color: Color(0xff191C1F),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                        ])),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff001441),
                        shadowColor: Color(0xff001441),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      child: Text("MAKE PAYMENT"),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff001441),
                        shadowColor: Color(0xff001441),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      child: Text("GET TITLE STATUS"),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff001441),
                        shadowColor: Color(0xff001441),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.only(left: 0),
                      ),
                      child: Text("TRACK SHIPMENT"),
                    )),
              ]),
        ));
  }

  Widget WatchlistItem(BuildContext context, int index) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    height: 208,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/loading-image.png',
                      height: 208,
                      fit: BoxFit.fill,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'images/Screenshot.png',
                          height: 208,
                          fit: BoxFit.fill,
                        );
                      },
                      image: "images/Screenshot.png",
                    ),
                  ),
                  Positioned(
                      top: 0.0,
                      right: 5.0,
                      child: new IconButton(
                          icon: new Image.asset('images/icon-heart.png'),
                          onPressed: () {},
                          iconSize: 50)),
                  Positioned(
                      right: 5.0,
                      bottom: 0.0,
                      child: new IconButton(
                          icon: new Image.asset('images/icon-eye.png'),
                          onPressed: () {},
                          iconSize: 50)),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 0.0, top: 0, bottom: 10),
                  child: Text(
                    "2016 Ford Exporer",
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Color(0xff191C1F),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "20,264 miles",
                              style: TextStyle(
                                color: Color(0xff0045DE),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        SizedBox(
                          height: 4.0,
                        ),
                        Align(
                            child: Text(
                              "Mileage",
                              style: TextStyle(
                                color: Color(0xff110F45),
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                            child: Text(
                              "01:29:10",
                              style: TextStyle(
                                color: Color(0xff0045DE),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        SizedBox(
                          height: 4.0,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Starting In",
                              style: TextStyle(
                                color: Color(0xff110F45),
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Center(
                  child: Text(
                    "\$45,786",
                    style: TextStyle(
                      color: Color(0xff0045DE),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              SizedBox(
                height: 4.0,
              ),
              Center(
                  child: Text(
                    "Starting BID",
                    style: TextStyle(
                      color: Color(0xff110F45),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
                alignment: Alignment.bottomCenter,
                height: 40.0,
                color: Colors.transparent,
                child: Container(
                    padding:
                    EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                    decoration: BoxDecoration(
                        color: Color(0xff001441),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    child: new Center(
                      child: new Text(
                        "DETAILS",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
            ]));
  }
}