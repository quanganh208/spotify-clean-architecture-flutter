import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/create_user.dart';
import 'package:spotify_clone/data/models/sign_in_user.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUser createUser);

  Future<Either> signIn(SignInUser signInUser);
}
