import 'package:dio/dio.dart';

import '../../../../dg-components/constants/data.dart';
import '../../domain/entities/verify_phone_data.dart';
import '../models/verify_phone_data_model.dart';
abstract class UserRemoteDataSource {
  Future<VerifyPhoneData> getUserData({
    required String phoneNumber,
  });

  Future<VerifyPhoneData> getVerifyOtpData({
    required String otp,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio client;

  UserRemoteDataSourceImpl({required this.client});

  Future<VerifyPhoneData> getUserData(
      {required String phoneNumber}) async {
    try {
      String url = backendApi + '/verifymobile';
      String endpoint = url;
      var cData = {"mobile":phoneNumber};
      final response = await client.post(endpoint,data: cData);
      VerifyPhoneData verifyPhoneData = VerifyPhoneData.sample;
      print(response);
      print("UserRemoteDataSourceImpl->getUserData response");
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
      Map<String, dynamic> dataResponse = response.data;
      dynamic dataList = dataResponse;
      print("data is ");
      print(dataList);
      try {
          print("serilization try");
          VerifyPhoneDataModel verifyPhoneDataModel =
              VerifyPhoneDataModel.fromJson(dataList);
          print("serilization ok");
          verifyPhoneData = verifyPhoneDataModel.toEntity();
        } catch (innerExp) {
          print(
              'UserRemoteDataSourceImpl->getUserData innerExp $innerExp');
        }
      print("UserRemoteDataSourceImpl->getUserData return rightData");
      print(verifyPhoneData);
      return verifyPhoneData;
    } catch (exp) {
      print("UserRemoteDataSourceImpl->getUserData throw exception");
      rethrow;
    }
  }

  Future<VerifyPhoneData> getVerifyOtpData(
      {required String otp}) async {
    try {
      String url = backendApi + '/verifyotp';
      String endpoint = url;
      var cData = {"otp":otp};
      final response = await client.post(endpoint,data: cData);
      VerifyPhoneData verifyOtpData = VerifyPhoneData.sample;
      print(response);
      print("UserRemoteDataSourceImpl->getVerifyOtpData response");
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
      Map<String, dynamic> dataResponse = response.data;
      dynamic dataList = dataResponse;
      print("data is ");
      print(dataList);
      try {
          print("serilization try");
          VerifyPhoneDataModel verifyOtpDataModel =
              VerifyPhoneDataModel.fromJson(dataList);
          print("serilization ok");
          verifyOtpData = verifyOtpDataModel.toEntity();
        } catch (innerExp) {
          print(
              'UserRemoteDataSourceImpl->getVerifyOtpData innerExp $innerExp');
        }
      print("UserRemoteDataSourceImpl->getVerifyOtpData return rightData");
      print(verifyOtpData);
      return verifyOtpData;
    } catch (exp) {
      print("UserRemoteDataSourceImpl->getVerifyOtpData throw exception");
      rethrow;
    }
  }
}