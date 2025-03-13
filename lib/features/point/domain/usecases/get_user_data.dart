import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/verify_phone_data.dart';
import '../repositories/user_repository.dart';

class GetUserData implements UseCase<VerifyPhoneData, GetUserDataParams>{
  final UserRepository userRepository;

  GetUserData({required this.userRepository});
  @override
  Future<Either<Failure, VerifyPhoneData>> call(GetUserDataParams params) async{
    // TODO: implement call
    // throw UnimplementedError();
    print("GetUserData->call() - usecase");
    return await userRepository.getUserData(phoneNumber: params.phoneNumber);
  }

}

class GetUserDataParams extends Equatable {
  final String phoneNumber;
  const GetUserDataParams({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}