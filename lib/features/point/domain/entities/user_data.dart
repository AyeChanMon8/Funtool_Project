import 'dart:math';


class UserData
{
  int id;
  String fullName;
  String userName;
  String email;
  String mobile;
  String pinCode;
  String area;
  String city;
  String state;
  String birthdate;
  String gender;
  String interest;
  String profilePhoto;
  String status;
  String aboutMe;
  String deviceToken;
  String apiToken;
  String interestType;
  String createdAt;
  String updatedAt;

  UserData({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.mobile,
    required this.pinCode,
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

  static UserData get sample {
    return UserData(
        id: 0,
        fullName: "",
        userName: "",
        email: "",
        mobile: "",
        pinCode: "",
        area: "",
        city: "",
        state: "",
        birthdate: "",
        gender: "",
        interest: "",
        profilePhoto: "",
        status: "",
        aboutMe: "",
        deviceToken: "",
        apiToken: "",
        interestType: "",
        createdAt: "",
        updatedAt: ""
    );
  }
  UserData clone(){
    return UserData(id: id,fullName: fullName, userName: userName, email: email, mobile: mobile, pinCode: pinCode, area: area, city: city, state: state, birthdate: birthdate, gender: gender, interest: interest, profilePhoto: profilePhoto, status: status, aboutMe: aboutMe, deviceToken: deviceToken, apiToken: apiToken, interestType: interestType, createdAt: createdAt, updatedAt: updatedAt);
  }

}