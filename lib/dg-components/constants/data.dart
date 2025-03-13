import 'package:flutter/material.dart';

import '../../features/point/domain/entities/created_by_me.dart';

const String backendApi = 'https://saunak.rulinggrowth.com/api';

const kPrimaryColor = Color(0xFF015BAD);
const kSecondaryColor = Color(0xFF015BAD);
const textColor = Color(0xFF212121);
const forgetTextColor = Color(0XFF545454);
const signupTextColor = Color(0xFF2B607B);
const buttonTopColor = Color(0XFF2C82AF);
const buttonBottomColor = Color(0XFF295772);
const dropDownCircleColor = Color(0XFF606060);
const otpTextColor = Color(0XFFD01111);
const appBarColor = Color(0XFF0a110f);
const cardBgColor = Color(0XFF2e2e2e);
const cardTextColor = Color(0XFF232323);
const viewAllTextColor = Color(0XFF1D6B94);
const tabTopColor = Color(0XFF92CD01);
const tabBottomColor = Color(0XFF3AB549);
const createdCardBGColor = Color(0XFF356080);
const opacityColor = Color(0XFF2B607B);

List<CreatedByMe> createdByMeList = [
  CreatedByMe(
      id: 1,
      name: "The Crafted Corner",
      totalGoal: '\$50000',
      netGoal: "\$10000",
      members: "150",
      image: "assets/images/createdByMeImg1.png"),
  CreatedByMe(
      id: 2,
      name: "The Fashion Fusion",
      totalGoal: '\$50000',
      netGoal: "\$10000",
      members: "150",
      image: "assets/images/createdByMeImg2.png"),
  CreatedByMe(
      id: 3,
      name: "Sweet Delights Bakery",
      totalGoal: '\$50000',
      netGoal: "\$10000",
      members: "150",
      image: "assets/images/createdByMeImg3.png"),
  CreatedByMe(
      id: 4,
      name: "The Bookworm's Haven",
      totalGoal: '\$50000',
      netGoal: "\$10000",
      members: "150",
      image: "assets/images/createdByMeImg4.png")
];