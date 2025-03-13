import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/verify_phone_data.dart';
import '../../domain/usecases/get_user_data.dart';
import '../../domain/usecases/get_verify_otp_data.dart';

class UserProvider extends ChangeNotifier {
  final GetUserData getUserDataUseCase;
  final GetVerifyOtpData getVerifyOtpDataUseCase;
  UserProvider(
      {required this.getUserDataUseCase,
      required this.getVerifyOtpDataUseCase});

  bool userLoading = false;
  String userDescription = "";
  VerifyPhoneData userData = VerifyPhoneData.sample;

  bool otpVerifyLoading = false;
  String otpVerifyDescription = "";
  VerifyPhoneData otpVerifyData = VerifyPhoneData.sample;

  Future<VerifyPhoneData> plzGetUserData(String phoneNumber) async {
    print("UserProvider->plzGetUserData");
    userDescription = '';
    userLoading = true;
    final Either<Failure, VerifyPhoneData> userDataEither =
        await getUserDataUseCase(GetUserDataParams(phoneNumber: phoneNumber));
    return userDataEither.fold((failure) {
      // we don't need to do anything
      userLoading = false;
      print("user provider falure");
      userDescription = "No More Data";
      notifyListeners();
      return VerifyPhoneData.sample;
    }, (data) {
      userData = data;
      userLoading = false;
      notifyListeners();
      return userData;
    });
  }

  Future<VerifyPhoneData> plzGetVerifyOtp(String otp) async {
    print("UserProvider->plzGetVerifyOtp");
    otpVerifyDescription = '';
    otpVerifyLoading = true;
    final Either<Failure, VerifyPhoneData> userDataEither =
        await getVerifyOtpDataUseCase(GetVerifyOtpDataParams(otp: otp));
    return userDataEither.fold((failure) {
      // we don't need to do anything
      otpVerifyLoading = false;
      print("user provider falure");
      otpVerifyDescription = "No More Data";
      notifyListeners();
      return VerifyPhoneData.sample;
    }, (data) async {
      otpVerifyData = data;
      otpVerifyLoading = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('id', data.data.id);
      notifyListeners();
      return otpVerifyData;
    });
  }
}
