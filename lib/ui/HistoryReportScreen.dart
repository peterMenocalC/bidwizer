import 'package:bidwiser/BWNetwork.dart';
import 'package:bidwiser/VehicleJSIPage.dart';
import 'package:bidwiser/VehicleSalesPage.dart';
import 'package:bidwiser/VehicleSpecificationPage.dart';
import 'package:bidwiser/VehicleTitlePage.dart';
import 'package:bidwiser/model/VehicleHistoryResponse.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryReportScreen extends StatelessWidget {

  HistoryReportScreen(this.historyResponse);

  final VehicleHistoryResponse historyResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffEFF0F4),
        margin:
         EdgeInsets.only(left: 0.0, right: 0.0, top: 10, bottom: 20.h),
        child: SingleChildScrollView(child: Column(children: [
          SizedBox(height: 2.h,),
          Card(
              margin: EdgeInsets.only(
                  right: 0.w, left: 0.w, top: 0.h, bottom: 0.h),
              child: Container(
                padding: EdgeInsets.only(
                    right: 4.w, left: 4.w, top: 1.h, bottom: 2.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "VIN",
                        style: TextStyle(
                          color: Color(0xff2A2F32),
                          fontFamily: 'BarlowSemiCondensed',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        historyResponse != null && historyResponse.data != null
                            && historyResponse.data.specificationData != null &&
                            historyResponse.data.specificationData.isNotEmpty
                            && historyResponse.data.specificationData[0] != null
                            ?
                        historyResponse.data.specificationData[0].vIN
                            : "--",
                        style: TextStyle(
                          color: Color(0xff2A2F32),
                          fontFamily: 'BarlowSemiCondensed',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "REPORT ID",
                        style: TextStyle(
                          color: Color(0xff2A2F32),
                          fontFamily: 'BarlowSemiCondensed',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        historyResponse != null && historyResponse.data != null
                            && historyResponse.data.specificationData != null &&
                            historyResponse.data.specificationData.isNotEmpty
                            &&
                            historyResponse.data.specificationData[0] != null &&
                            historyResponse.data.specificationData[0]
                                .vehicleSpecifications != null
                            && historyResponse.data.specificationData[0]
                            .vehicleSpecifications.isNotEmpty
                            && historyResponse.data.specificationData[0]
                            .vehicleSpecifications[0] != null
                            && historyResponse.data.specificationData[0]
                            .vehicleSpecifications[0].input != null
                            ? historyResponse.data.specificationData[0]
                            .vehicleSpecifications[0].input.key
                            : "--",
                        style: TextStyle(
                          color: Color(0xff2A2F32),
                          fontFamily: 'BarlowSemiCondensed',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "GENERATED",
                        style: TextStyle(
                          color: Color(0xff2A2F32),
                          fontFamily: 'BarlowSemiCondensed',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        "2011-03-27 21:19:24 GMT",
                        style: TextStyle(
                          color: Color(0xff2A2F32),
                          fontFamily: 'BarlowSemiCondensed',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ]),)),
          SizedBox(height: 2.h,),
          Card(
              margin: EdgeInsets.only(
                  right: 0.w, left: 0.w, top: 0.h, bottom: 0.h),
              child: Container(
                padding: EdgeInsets.only(
                    right: 4.w, left: 4.w, top: 1.h, bottom: 2.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Vehicle Specifications",
                                  style: TextStyle(
                                    color: Color(0xff2A2F32),
                                    fontFamily: 'BarlowSemiCondensed',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        if (historyResponse != null &&
                            historyResponse.data != null && historyResponse.data
                            .specificationData[0] != null
                            && historyResponse.data.specificationData[0]
                                .vehicleSpecifications[0] != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VehicleSpecificationPage(
                                      historyResponse?.data
                                          ?.specificationData[0]
                                          ?.vehicleSpecifications[0])));
                        } else {
                          showToast("Vehicle Specification is not available!");
                        }
                      },),

                      SizedBox(height: 2.h,),

                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Title Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    VehicleTitlePage(
                                        historyResponse != null &&
                                            historyResponse.data != null
                                            &&
                                            historyResponse.data.historyData !=
                                                null
                                            && historyResponse.data.historyData
                                            .isNotEmpty
                                            &&
                                            historyResponse.data.historyData[0]
                                                .vehicleHistory != null
                                            &&
                                            historyResponse.data.historyData[0]
                                                .vehicleHistory.isNotEmpty
                                            &&
                                            historyResponse.data.historyData[0]
                                                .vehicleHistory[0].titles !=
                                                null
                                            &&
                                            historyResponse.data.historyData[0]
                                                .vehicleHistory[0].titles
                                                .isNotEmpty
                                            ? historyResponse.data
                                            .historyData[0].vehicleHistory[0]
                                            .titles
                                            : []
                                    )));
                      },),
                      SizedBox(height: 2.h,),
                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Junk / Salvage / Insurance Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ),

                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      VehicleJSIPage(
                                          historyResponse != null &&
                                              historyResponse.data != null
                                              && historyResponse.data
                                              .historyData != null
                                              &&
                                              historyResponse.data.historyData
                                                  .isNotEmpty
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory !=
                                              null
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory
                                              .isNotEmpty
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory[0]
                                              .jsi != null
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory[0]
                                              .jsi.isNotEmpty
                                              ? historyResponse.data
                                              .historyData[0].vehicleHistory[0]
                                              .jsi
                                              : []
                                      )));
                        },),
                      SizedBox(height: 2.h,),
                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Accident Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        showToast("Accident Records are not available!");
                      },),
                      SizedBox(height: 2.h,),

                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Theft Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        showToast("Theft Records are not available!");
                      }),
                      SizedBox(height: 2.h,),

                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Lien / Impound / Export Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        showToast(
                            "Lien / Impound / Export Records are not available!");
                      }),
                      SizedBox(height: 2.h,),

                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Salvage Auction Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        showToast("Salvage Auction Records are not available!");
                      }),
                      SizedBox(height: 2.h,),
                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Sale Records",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      VehicleSalesPage(
                                          historyResponse != null &&
                                              historyResponse.data != null
                                              && historyResponse.data
                                              .historyData != null
                                              &&
                                              historyResponse.data.historyData
                                                  .isNotEmpty
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory !=
                                              null
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory
                                              .isNotEmpty
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory[0]
                                              .sales != null
                                              && historyResponse.data
                                              .historyData[0].vehicleHistory[0]
                                              .sales.isNotEmpty
                                              ? historyResponse.data
                                              .historyData[0].vehicleHistory[0]
                                              .sales
                                              : []
                                      )));
                        },),
                      SizedBox(height: 2.h,),

                      InkWell(child: Container(
                          height: 8.h,
                          padding: EdgeInsets.only(
                              left: 2.w, right: 2.0.w, top: 0, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(
                              BorderSide(color: Color(0xff17C0CC)),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Title Checks",
                                  style: TextStyle(
                                    fontFamily: 'BarlowSemiCondensed',
                                    color: Color(0xff2A2F32),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff17C0CC),
                                ),
                              )
                            ],
                          )
                      ), onTap: () {
                        showToast("Title Checks are not available!");
                      }),
                      SizedBox(height: 2.h,),
                    ]),))
        ],)));
  }
}