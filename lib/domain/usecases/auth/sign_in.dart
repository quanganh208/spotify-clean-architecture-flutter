import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/sign_in_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUser> {
  @override
  Future<Either> call({SignInUser? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
