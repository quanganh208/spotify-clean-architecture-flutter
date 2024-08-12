import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/data_sources/auth_firebase_service.dart';
import 'package:spotify_clone/data/models/create_user.dart';
import 'package:spotify_clone/data/models/sign_in_user.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUser signInUser) async {
    return await sl<AuthFirebaseService>().signIn(signInUser);
  }

  @override
  Future<Either> signUp(CreateUser createUser) async {
    return await sl<AuthFirebaseService>().signUp(createUser);
  }
}
