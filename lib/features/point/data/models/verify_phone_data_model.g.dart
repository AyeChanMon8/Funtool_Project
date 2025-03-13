// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneDataModel _$VerifyPhoneDataModelFromJson(
        Map<String, dynamic> json) =>
    VerifyPhoneDataModel(
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] == null
          ? null
          : UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'type',
      otp: (json['otp'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? 'message',
    );

Map<String, dynamic> _$VerifyPhoneDataModelToJson(
        VerifyPhoneDataModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data?.toJson(),
      'type': instance.type,
      'otp': instance.otp,
      'message': instance.message,
    };
