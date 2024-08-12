import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/create_user.dart';
import 'package:spotify_clone/data/models/sign_in_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUser createUser);

  Future<Either> signIn(SignInUser signInUser);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUser signInUser) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUser.email,
        password: signInUser.password,
      );
      return const Right('User signed in successfully');
    } on FirebaseException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'invalid-credential') {
        errorMessage = 'Wrong password or email';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid';
      }
      return Left(errorMessage);
    }
  }

  @override
  Future<Either> signUp(CreateUser createUser) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUser.email,
        password: createUser.password,
      );
      return const Right('User created successfully');
    } on FirebaseException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid';
      }
      return Left(errorMessage);
    }
  }
}
