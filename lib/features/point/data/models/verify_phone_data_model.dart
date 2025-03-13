import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_data.dart';
import '../../domain/entities/verify_phone_data.dart';
import 'user_data_model.dart';

part 'verify_phone_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VerifyPhoneDataModel{
  @JsonKey(name: 'code', defaultValue: 0)
  int code;

  @JsonKey(name: "data", defaultValue: null)
  UserDataModel? data;

  @JsonKey(name: 'type', defaultValue: "type")
  String type;

  @JsonKey(name: 'otp', defaultValue: 0)
  int otp;

  @JsonKey(name: 'message', defaultValue: "message")
  String message;

  VerifyPhoneDataModel({
    required this.code,
    required this.data,
    required this.type,
    required this.otp,
    required this.message
  });

  factory VerifyPhoneDataModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyPhoneDataModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$VerifyPhoneDataModelToJson(this);

  VerifyPhoneData toEntity(){
    return VerifyPhoneData(
        code: code,
        data: data?.toEntity() ?? UserData.sample,
        type: type,
        otp: otp,
        message: message
    );
  }
}