import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/verify_phone_data.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, VerifyPhoneData>> getUserData({required String phoneNumber}) async {
    try {
      VerifyPhoneData verifyData =
          await userRemoteDataSource.getUserData(phoneNumber: phoneNumber);
      return Right(verifyData);
    } catch (exp) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, VerifyPhoneData>> getVerifyOtpData({required String otp}) async {
    try {
      VerifyPhoneData otpVerifyData =
          await userRemoteDataSource.getVerifyOtpData(otp: otp);
      return Right(otpVerifyData);
    } catch (exp) {
      return Left(ServerFailure());
    }
  }

}