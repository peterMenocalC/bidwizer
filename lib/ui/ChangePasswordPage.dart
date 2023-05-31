
class ChangePasswordPage extends StatefulWidget {

  const ChangePasswordPage();

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isLoading = false;
  var autoValidate = false;

  bool visible = false;
  FocusNode myFocusNode = new FocusNode();

  final firstPWDController = TextEditingController();
  final secondPWDController = TextEditingController();
  final verificationCodeController = TextEditingController();

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
    firstPWDController.dispose();
    secondPWDController.dispose();
    verificationCodeController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bool _isObscure = true;

    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          appBar:  AppBar(
            leading: GestureDetector(
                onTap: (){
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
                  "CHANGE PASSWORD",
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
              color: Color(0xffEFF0F4),
              child: Container(
                  margin:
                  const EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                  color: Colors.white,
                  child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 0.0, right: 0.0, top: 20.0),
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: Color(0xffF8A27F), fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Set your new password',
                                      style: TextStyle(
                                        color: Color(0xff011341),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 0.0, top: 0, bottom: 0),
                            child: Text("Create Password",
                                style: TextStyle(
                                  color: Color(0xff1F3158),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              height: 45,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(color: Colors.black12),
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
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
                                  obscureText: _isObscure,
                                  controller: firstPWDController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon:
                                    IconButton(
                                      icon: Icon(
                                        _isObscure ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 0.0, top: 0, bottom: 0),
                            child: Text("Confirm Password",
                                style: TextStyle(
                                  color: Color(0xff1F3158),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              height: 45,
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(color: Colors.black12),
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
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
                                  obscureText: true,
                                  controller: secondPWDController,
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
                               performChangePWD();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width / 2,
                                    height: 50,
                                    padding: EdgeInsets.all(15.0),
                                    child: Center(
                                        child: Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 14.0),
                                        )),
                                    decoration: BoxDecoration(
                                        color: Color(0xff001441),
                                        borderRadius:
                                        BorderRadius.circular(100.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xffACB0BB),
                                              offset: Offset(-2, 3),
                                              blurRadius: 1.0,
                                              spreadRadius: 1.0),
                                          BoxShadow(
                                              color: Color(0xffACB0BB),
                                              offset: Offset(-2, -2),
                                              blurRadius: 1.0,
                                              spreadRadius: 1.0)
                                        ]),
                                  ))),
                          SizedBox(
                            height: 30.0,
                          )
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
      new Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'images/login-bg-2.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ))
    ]);
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
        performChangePWD()
      })
          .catchError((e) {
        setState(() {
          isLoading = false;
        });
        print("Failed to refresh token due to " + e.toString());
        if(e is CustomException && e.errorCode == 401) {
          clearAndPushToStart(context);
        }
      });
    });
  }

  void performChangePWD() {
    if (firstPWDController.text.isEmpty) {
      showToast("First password can not be empty");
    } else if (secondPWDController.text.isEmpty) {
      showToast(
          "Confirm password can not be empty");
    } else if (firstPWDController.text !=
        secondPWDController.text) {
      showToast("Both passwords needs to be same");
    }
    else {
      setState(() {
        setState(() {
          isLoading = true;
        });
        changePassword(
            firstPWDController.text)
            .then((value) => {
          showToast("Password change successfully!!"),
          Navigator.pop(context)
        })
            .catchError((e) async {
          setState(() {
            isLoading = false;
          });
          showToast(e.toString());
          if(e is CustomException && e.errorCode == 401) {
            doRefreshToken();
          }
        });
      });
    }
  }
}
