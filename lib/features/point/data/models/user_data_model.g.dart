// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      fullname: json['fullname'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      area: json['area'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      birthdate: json['birthdate'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      interest: json['interest'] as String? ?? '',
      profilePhoto: json['profile_photo'] as String? ?? '',
      status: json['status'] as String? ?? '',
      aboutMe: json['about_me'] as String? ?? '',
      deviceToken: json['device_token'] as String? ?? '',
      apiToken: json['api_token'] as String? ?? '',
      interestType: json['intrest_type'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'mobile': instance.mobile,
      'pincode': instance.pincode,
      'area': instance.area,
      'city': instance.city,
      'state': instance.state,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'interest': instance.interest,
      'profile_photo': instance.profilePhoto,
      'status': instance.status,
      'about_me': instance.aboutMe,
      'device_token': instance.deviceToken,
      'api_token': instance.apiToken,
      'intrest_type': instance.interestType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
