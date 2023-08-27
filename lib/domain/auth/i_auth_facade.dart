// i = interfase
// facacade = it is a design pattern for conectinting two or more classes with weird interfaces into just one simplfied interface.
// in our case connect Firebase auth and google sign in.

import 'package:dartz/dartz.dart';
import 'package:ddd/domain/auth/auth_failure.dart';
import 'package:ddd/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future <Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required PassWord password,
  });

  Future<Either<AuthFailure,Unit>> sighInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required PassWord password,
  });

  Future <Either<AuthFailure, Unit>> signInWithGoogle();
}
