import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_data.dart';

part 'user_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDataModel{
  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'fullname', defaultValue: "")
  String fullname;

  @JsonKey(name: 'username', defaultValue: "")
  String username;

  @JsonKey(name: 'email', defaultValue: "")
  String email;

  @JsonKey(name: 'mobile', defaultValue: "")
  String mobile;

  @JsonKey(name: 'pincode', defaultValue: "")
  String pincode;

  @JsonKey(name: 'area', defaultValue: "")
  String area;

  @JsonKey(name: 'city', defaultValue: "")
  String city;

  @JsonKey(name: 'state', defaultValue: "")
  String state;

  @JsonKey(name: 'birthdate', defaultValue: "")
  String birthdate;

  @JsonKey(name: 'gender', defaultValue: "")
  String gender;

  @JsonKey(name: 'interest', defaultValue: "")
  String interest;

  @JsonKey(name: 'profile_photo', defaultValue: "")
  String profilePhoto;

  @JsonKey(name: 'status', defaultValue: "")
  String status;

  @JsonKey(name: 'about_me', defaultValue: "")
  String aboutMe;

  @JsonKey(name: 'device_token', defaultValue: "")
  String deviceToken;

  @JsonKey(name: 'api_token', defaultValue: "")
  String apiToken;

  @JsonKey(name: 'intrest_type', defaultValue: "")
  String interestType;

  @JsonKey(name: 'created_at', defaultValue: "")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "")
  String updatedAt;
  UserDataModel({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.mobile,
    required this.pincode,
    required this.area,
    required this.city,
    required this.state,
    required this.birthdate,
    required this.gender,
    required this.interest,
    required this.profilePhoto,
    required this.status,
    required this.aboutMe,
    required this.deviceToken,
    required this.apiToken,
    required this.interestType,
    required this.createdAt,
    required this.updatedAt
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return _$UserDataModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

  UserData toEntity(){
    return UserData(
        id: id,
        fullName: fullname,
        userName: username,
        email: email,
        mobile: mobile,
        pinCode: pincode,
        area: area,
        city: city,
        state: state,
        birthdate: birthdate,
        gender: gender,
        interest: interest,
        profilePhoto: profilePhoto,
        status: status,
        aboutMe: aboutMe,
        deviceToken: deviceToken,
        apiToken: apiToken,
        interestType: interestType,
        createdAt: createdAt,
        updatedAt: updatedAt
    );
  }
}