
import 'user_data.dart';

class VerifyPhoneData{
  int code;
  UserData data;
  String type;
  int otp;
  String message;
  VerifyPhoneData({
    required this.code,
    required this.data,
    required this.type,
    required this.otp,
    required this.message
  });

  static VerifyPhoneData get sample {
    return VerifyPhoneData(
        code: 0,
        data: UserData.sample,
        type: "type",
        otp: 0,
        message: ""
    );
  }
  VerifyPhoneData clone(){
    return VerifyPhoneData(code: code,data: data,type: type, otp: otp,  message: message);
  }

}