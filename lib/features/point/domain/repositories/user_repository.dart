import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/verify_phone_data.dart';

abstract class UserRepository {
  Future<Either<Failure, VerifyPhoneData>> getUserData(
      {required String phoneNumber});

  Future<Either<Failure, VerifyPhoneData>> getVerifyOtpData(
      {required String otp});

}