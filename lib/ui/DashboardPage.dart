
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'BWNetwork.dart';
import 'model/ClientSecret.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage();


  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String paymentIntentData;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: (){
          makePayment();
        },
        child: Text('Pay'),
      ),),
    ));
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  Future<void>makePayment() async {


    getClientSeceret()
        .then((value) async => {
      paymentIntentData = value.data.clientSecret,
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData,
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          merchantCountryCode: 'US',
          merchantDisplayName: 'Bidwizer',
            primaryButtonColor: Color(0xff001441),
      )),

      setState(() {
        displayPaymentSheet();
      })


    })
        .catchError((e) async {
      print(e);
    });

/*    final url = Uri.parse('https://us-centrall-flutterdemo-c949a.cloudfunctions.net/stripePayment');
    final response = await http.get(url, headers: {'Content-Type': 'application/json' });

    paymentIntentData = json.decode (response.body);*/



  }

  Future<String> displayPaymentSheet() async {

    try{
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(clientSecret:  paymentIntentData,
              confirmPayment: true)
      );

      setState(() {
        paymentIntentData = null;
      });


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment Successful')));
    }
    catch (e){
      print(e);
    }
  }


  Future<ClientSecret> getClientSeceret() async {
    try {
      String AccessToken = "eyJraWQiOiJWcXlGOVVOMzVLeVgrdHpVYnR3UnFERzFJaGlweStib29tNkpcL3piSEdmOD0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzNjdkNDNkNC01MTZiLTRjM2QtYmUyYy0wMTE3Yjg2ODg1NTMiLCJjb2duaXRvOmdyb3VwcyI6WyJid2RlYWxlciJdLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0xLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMV95STBjbE5VTGEiLCJjbGllbnRfaWQiOiI1MzA4c2FiNmhiZDFqa2M3bjE5azRyNGI1cSIsIm9yaWdpbl9qdGkiOiI0YmJkZDI1Zi01NzZlLTRmZmYtOTY3Yy0xYzE0NzhhMzBkNTUiLCJldmVudF9pZCI6ImRjYjdiNzY2LWJkOGUtNDcwNC1iYWVjLTUyNWMwMGYyMGNiMSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2NDgxMjY0OTUsImV4cCI6MTY0ODE0ODA5NSwiaWF0IjoxNjQ4MTI2NDk1LCJqdGkiOiJmMzYyNWRmYy0wOWY1LTQwNzEtOGNjMC05YzgxMGFlZjVmZTAiLCJ1c2VybmFtZSI6IjM2N2Q0M2Q0LTUxNmItNGMzZC1iZTJjLTAxMTdiODY4ODU1MyJ9.kumJiHoh81d14AjuCfKRv1JBqlcGflmlLlj2NBtVFeEXrVa8QV_IgD9mWqD1jhagD5CRMy4b4wevPzXoPyGE94GFJw0nBiXN73CFH2sTSADridiZD7NUAUAdthUeFSlsU8JBh-b3Log6yCyKn7fo1z_pSUY6_Ig0_g6WiSicYg2yWkNI5iN5uKrgykEVRO58R1qy59G-XlpKWpRh2JJL0TL-jXmKU_lthBM0Ndf90i25hF8rUl0otS_vTwR0uMbSf0-7rJUF5RxLCoHIoa6-rhBJZziTqpRo7Aje4K1BMmvynucV69UtPtU41MWcucJKPsDmnvr5EYJ0o-23oKIEFg";
      //String AccessToken = "eyJraWQiOiJWcXlGOVVOMzVLeVgrdHpVYnR3UnFERzFJaGlweStib29tNkpcL3piSEdmOD0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJkNjVkYjc3ZS05ZTUxLTRlMWMtODQ5Yy0xMDQ3MmQ3OGEyODgiLCJjb2duaXRvOmdyb3VwcyI6WyJid3VzZXIiXSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLnVzLWVhc3QtMS5hbWF6b25hd3MuY29tXC91cy1lYXN0LTFfeUkwY2xOVUxhIiwiY2xpZW50X2lkIjoiNTMwOHNhYjZoYmQxamtjN24xOWs0cjRiNXEiLCJvcmlnaW5fanRpIjoiZmQ2ODEwNmYtMDQzMS00OTlmLTkzMDAtNGJlZGU1OWMxZDhjIiwiZXZlbnRfaWQiOiI0ZTdmODIwNC1hNzBlLTRmZDctYjM1OS05OTNiZjEwODVlZmIiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6ImF3cy5jb2duaXRvLnNpZ25pbi51c2VyLmFkbWluIiwiYXV0aF90aW1lIjoxNjQzNzgxMjEzLCJleHAiOjE2NDM3ODQ4MTMsImlhdCI6MTY0Mzc4MTIxMywianRpIjoiNzdjZmYwM2EtNDE5MS00MTZiLTg0NGYtMGJjMjk4YzcyN2Q1IiwidXNlcm5hbWUiOiJkNjVkYjc3ZS05ZTUxLTRlMWMtODQ5Yy0xMDQ3MmQ3OGEyODgifQ.SmGRN6a6Sp4wap0Xw5vanmmXcT8mB4q5Ly_D4ySdWbMyQWSvrN8Sxt21OiKlkLAFZiV-yPiE2oIURUJFpkieCFO9ZV0J2srkNYS0k6V5P9TlZR18zK0Xj9hnG6BWTN2kmaY93aYYIbHcFcWnxzzs42vKToCme3UTHAJBNqTFjA_d1-GoY1e6mDAbmM8WeAg3IvxKGsMf2ym5ZDWvEQ0cJJfwmbOxNm34xN5igJT76utqrwmSYo_KQ4tbE6yxMnIz00EtNPLwIibExPJLa7hAr1BwwxnUEplZAI4Gs6Nsyzll-7UvM3-1lWnwpH6_kYhtVoJK5VGXnjEqwWfEZf5JMQ";
      final httpClient = HttpClient();
      final request = await httpClient
          .getUrl(Uri.https(BASE_URL, "/dev/payments/367d43d4-516b-4c3d-be2c-0117b8688553/secret"));
      // headers
      request.headers.contentType = new ContentType("application", "json");
      request.headers.add(HttpHeaders.authorizationHeader, "Bearer $AccessToken");

      // body
      final response = await request.close();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = await response.transform(utf8.decoder).join();
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return ClientSecret.fromJson(jsonDecode(responseBody));      } else {
        final responseBody = await response.transform(utf8.decoder).join();
        throw  jsonDecode(responseBody)['message'];
      }
    } on TimeoutException catch (_) {
      throw 'The connection has timed out, Please try again!';
    }
  }
}