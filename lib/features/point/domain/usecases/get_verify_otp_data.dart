import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/verify_phone_data.dart';
import '../repositories/user_repository.dart';

class GetVerifyOtpData implements UseCase<VerifyPhoneData, GetVerifyOtpDataParams>{
  final UserRepository userRepository;

  GetVerifyOtpData({required this.userRepository});
  @override
  Future<Either<Failure, VerifyPhoneData>> call(GetVerifyOtpDataParams params) async{
    print("GetVerifyOtpData->call() - usecase");
    return await userRepository.getVerifyOtpData(otp: params.otp);
  }

}

class GetVerifyOtpDataParams extends Equatable {
  final String otp;
  const GetVerifyOtpDataParams({required this.otp});

  @override
  List<Object> get props => [otp];
}