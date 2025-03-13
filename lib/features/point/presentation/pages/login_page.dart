import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/util/loading_dialog.dart';
import '../../../../dg-components/constants/data.dart';
import '../../../../dg-components/widgets/dialog/toast_message.dart';
import '../../../../routes/app_pages.dart';
import '../../domain/entities/verify_phone_data.dart';
import '../providers/user_provider.dart';
import 'otp_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Custom validation method for phone number
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController =
      TextEditingController(); // Controller for phone input

  late StreamSubscription<InternetStatus> _connectionSubscription;
  bool _isConnected = true;

  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    _startMonitoring();
  }

  void _startMonitoring() {
    _connectionSubscription =
        InternetConnection().onStatusChange.listen((status) {
      setState(() {
        _isConnected = (status == InternetStatus.connected);
      });
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjust layout when keyboard appears

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Image.asset("assets/images/logo.png")),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: Duration(milliseconds: 1400),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Please login your account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: SingleChildScrollView(
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              IntlPhoneField(
                                                controller: _phoneController,
                                                enabled: true,
                                                readOnly: false,
                                                keyboardType:
                                                    TextInputType.phone,
                                                dropdownIconPosition:
                                                    IconPosition.trailing,
                                                showCountryFlag: false,
                                                dropdownIcon: Icon(
                                                  Icons
                                                      .arrow_drop_down_circle_rounded,
                                                  color: dropDownCircleColor
                                                      .withOpacity(0.4),
                                                ),
                                                flagsButtonPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: InputDecoration(
                                                  counterText: '',
                                                  labelText: 'Phone Number',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    borderSide: BorderSide(),
                                                  ),
                                                  suffixIcon: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Image.asset(
                                                      'assets/images/phone_icon.png', // Replace with your image asset
                                                      width: 24.06,
                                                      height: 24,
                                                    ),
                                                  ),
                                                ),
                                                initialCountryCode: "IN",
                                                onChanged: (phone) {
                                                  phoneNumber = phone.number;
                                                },
                                                validator: (phone) {
                                                  if (phone == null ||
                                                      phone.number.isEmpty) {
                                                    return 'Please enter a valid phone number';
                                                  }
                                                  return null;
                                                },
                                                onSaved: (phone) {
                                                  phoneNumber = phone?.number;
                                                },
                                              ),
                                              SizedBox(
                                                height: 60,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Forgot Password?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: forgetTextColor),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: 289.77,
                                                height: 54.79,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: opacityColor
                                                          .withOpacity(0.55),
                                                      offset:
                                                          Offset(4, 8), //(x,y)
                                                      blurRadius: 24.0,
                                                    ),
                                                  ],
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      buttonTopColor,
                                                      buttonBottomColor
                                                    ], // Gradient colors
                                                    begin: Alignment
                                                        .topLeft, // Starting point of the gradient
                                                    end: Alignment
                                                        .bottomRight, // Ending point of the gradient
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100), // Optional: rounded corners
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    validateAndSubmit(context);
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Login',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "Don't get any account ? ",
                                                        style: TextStyle(
                                                            color: textColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15),
                                                      ),
                                                      TextSpan(
                                                        text: 'Sign Up',
                                                        style: TextStyle(
                                                            color:
                                                                signupTextColor,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void validateAndSubmit(BuildContext context) {
    if (_isConnected) {
      if (phoneNumber != null && phoneNumber != "") {
        _validatePhone(phoneNumber!, context);
      } else {
        print("Form is invalid");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid phone number")),
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "No Internet Connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, // Position: TOP, CENTER, BOTTOM
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _validatePhone(String phoneNo, BuildContext context) async {
    final String phoneNumber = phoneNo;
    LoadingDialog.show(context);
    VerifyPhoneData data =
        await Provider.of<UserProvider>(context, listen: false)
            .plzGetUserData(phoneNumber);
    Future.delayed(Duration(seconds: 1), () async {
      LoadingDialog.hide(context);
      if (data != null && data.code == 1) {
        login(data.otp);
      } else {
        await showToastMessage(
            context: context, msg: "Your Phone Number is not Verified!");
      }
    });
  }

  void login(int otp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ), // Set the border radius here
          ),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "OTP Verification",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please your OTP to Verify",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your otp is "$otp"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: otpTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpWidget(_fieldOne, true), // auto focus
                  OtpWidget(_fieldTwo, false),
                  OtpWidget(_fieldThree, false),
                  OtpWidget(_fieldFour, false)
                ],
              ),
              SizedBox(
                height: 70,
              )
            ]),
          ),
          actions: <Widget>[
            Container(
              width: 289.77,
              height: 54.79,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    buttonTopColor,
                    buttonBottomColor
                  ], // Gradient colors
                  begin: Alignment.topLeft, // Starting point of the gradient
                  end: Alignment.bottomRight, // Ending point of the gradient
                ),
                borderRadius:
                    BorderRadius.circular(100), // Optional: rounded corners
                boxShadow: [
                  BoxShadow(
                    color: opacityColor.withOpacity(0.55),
                    offset: Offset(4, 8), //(x,y)
                    blurRadius: 24.0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () async {
                  // Get.offAllNamed(Routes.HOME);

                  if (_fieldOne.text == "" ||
                      _fieldTwo.text == "" ||
                      _fieldThree.text == "" ||
                      _fieldFour.text == "") {
                    Fluttertoast.showToast(
                      msg: "Otp Code is invalid!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity:
                          ToastGravity.BOTTOM, // Position: TOP, CENTER, BOTTOM
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    LoadingDialog.show(context);
                    String otp = _fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text;
                    VerifyPhoneData data =
                        await Provider.of<UserProvider>(context, listen: false)
                            .plzGetVerifyOtp(otp);
                    Future.delayed(Duration(seconds: 1), () async {
                      LoadingDialog.hide(context);
                      if (data.data.id != 0) {
                        Get.offAllNamed(Routes.HOME,
                            arguments: {"id": data.data.id});
                      } else {
                        await showToastMessage(
                            context: context, msg: "Your otp is wrong!");
                      }
                    });
                  }
                },
                child: Center(
                  child: Text(
                    'Verify',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        );
      },
    );
  }
}
