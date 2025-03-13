import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zyntech_project_test/features/point/domain/entities/created_by_me.dart';

import '../../../../dg-components/constants/data.dart';
import '../../../../routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late StreamSubscription<InternetStatus> _connectionSubscription;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _startMonitoring();
  }

  void _startMonitoring() {
    _connectionSubscription =
        InternetConnection().onStatusChange.listen((status) {
      setState(() {
        _isConnected = (status == InternetStatus.connected);
        if (!_isConnected) {
          showToast();
        }
      });
    });
  }

  Widget _otpTextField(int digit, Color color1, Color color2, Color textColor) {
    return new Container(
      width: 40.0,
      height: 40.0,
      alignment: Alignment.center,
      child: new Text(
        digit != 0 ? digit.toString() : "-",
        style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
      ),
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [buttonTopColor, buttonBottomColor], // Gradient colors
          //   begin: Alignment.topLeft, // Starting point of the gradient
          //   end: Alignment.bottomRight, // Ending point of the gradient
          // ),
          border: Border(
              bottom: BorderSide(
        width: 1.0,
        color: color1,
      ))),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: "No Internet Connection",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM, // Position: TOP, CENTER, BOTTOM
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments as Map<String, dynamic>?;
    int userID = data?["id"] ?? 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor, // Customize background color
          title: Image.asset(
            'assets/images/logo.png', // Replace with your image path
            height: 31, // Adjust size
          ),
          iconTheme: IconThemeData(
            color: Colors.white, // Change the color of the default menu icon
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/images/notification.png', // Replace with your image path
                width: 24, // Adjust size as needed
                height: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                // Handle action
              },
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          // The Drawer widget contains a ListView to display the options
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [tabTopColor, tabBottomColor], // Gradient colors
                  ),
                ),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  Get.offAllNamed(Routes.LOGIN);
                  await prefs.clear();
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cardBgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                    image: AssetImage("assets/images/card_background.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Join a Foundraiser",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Join your group fundraiser",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Enter invitation code",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Image.asset("assets/images/card_logo.png",
                            width: 99, height: 93, color: Color(0XFF737373))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _otpTextField(
                                5, tabTopColor, tabBottomColor, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            _otpTextField(
                                0,
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3)),
                            SizedBox(
                              width: 10,
                            ),
                            _otpTextField(
                                0,
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3)),
                            SizedBox(
                              width: 10,
                            ),
                            _otpTextField(
                                0,
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3)),
                            SizedBox(
                              width: 10,
                            ),
                            _otpTextField(
                                0,
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3)),
                            SizedBox(
                              width: 10,
                            ),
                            _otpTextField(
                                0,
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.3)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            "assets/images/green_right_circle.png",
                            width: 36,
                            height: 36,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: Offset(0, 4), //(x,y)
                    blurRadius: 18.0,
                  ),
                ],
              ),
              width: 390,
              height: 72,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Create a Fundraiser",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: cardTextColor),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Schedule a fundraiser for your group",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: cardTextColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Image.asset(
                          "assets/images/right_circle.png",
                          width: 36,
                          height: 36,
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 0, // Aligns to the right
                    bottom: 0, // Aligns to the bottom
                    child: CustomPaint(
                      size: Size(100, 100), // Size of the triangle
                      painter: GradientTrianglePainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Fundraisers",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: viewAllTextColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(90)),
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(90)),
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.black.withOpacity(0.2), width: 1),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          tabTopColor,
                          tabBottomColor
                        ], // Gradient colors
                        begin:
                            Alignment.topLeft, // Starting point of the gradient
                        end: Alignment
                            .bottomRight, // Ending point of the gradient
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black.withOpacity(0.6),
                    controller: _tabController,
                    tabs: [
                      Tab(text: "Created by me"),
                      Tab(text: "Joined by me"),
                    ],
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600), // Selected tab text style
                    unselectedLabelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            FontWeight.w600), // Unselected tab text style
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height, // Set a fixed height for TabBarView
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: createdByMeList.length,
                      itemBuilder: (context, index) {
                        return createdByMeWidget(createdByMeList[index]);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Joined by me'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ])));
  }

  createdByMeWidget(CreatedByMe data) {
    return Container(
      height: 145,
      width: 335,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6), // Outer shadow color
              blurRadius: 8,
              offset: Offset(0, 4), // Outer shadow offset
            ),
          ],
        ),
        child: Stack(children: [
          Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: createdCardBGColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          )),
                      child: Image.asset(
                        'assets/images/card_background.png',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110.0, top: 20),
                      child: Text(
                        data.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Goal : ",
                                        style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                      TextSpan(
                                        text: data.netGoal,
                                        style: TextStyle(
                                            color: forgetTextColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextSpan(
                                        text: ' / ' + data.totalGoal,
                                        style: TextStyle(
                                            color: signupTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Members : ",
                                        style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                      TextSpan(
                                        text: data.members,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/card_right_circle.png",
                        width: 34,
                        height: 34,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          // align a circle center and left, with a left margin
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      data.image,
                      height: 67,
                      width: 67,
                    ),
                  )))
        ]),
      ),
    );
  }
}

class GradientTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0XFF92CD01), Color(0XFF3AB549)], // Gradient colors
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
          Rect.fromLTRB(0, 0, size.width, size.height)) // Apply gradient
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(50, size.height); // Bottom-left corner
    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(size.width, 60); // Top-right corner
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
