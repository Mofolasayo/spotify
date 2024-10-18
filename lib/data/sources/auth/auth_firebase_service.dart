import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest signinUserRequest);
  Future<Either> signup(CreateUserRequest createUserRequest);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either<String, String>> signin(
      SigninUserRequest signinUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserRequest.email,
        password: signinUserRequest.password,
      );
      return const Right("Signin was successful");
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'invalid-email') {
        message = 'Invalid Email';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid credentials provided';
      } else {
        message = 'An unknown error occurred';
      }
      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signup(
      CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );
      return const Right("Signup was successful");
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'weak-password') {
        message = 'This password is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists';
      } else {
        message = 'An unknown error occurred';
      }
      return Left(message);
    }
  }
}
