import 'package:dartz/dartz.dart';
import 'package:ddd/domain/auth/value_objects.dart';
import 'package:ddd/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length < 8) {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
  // Password must contain at least one lowercase letter
  if (!input.contains(RegExp(r'[a-z]'))) {
    return left(ValueFailure.containOneLowerCase(failedValue: input));
  }

  // input must contain at least one digit
  if (!input.contains(RegExp(r'[0-9]'))) {
    return left(ValueFailure.containOneUpperCase(failedValue: input));
  } else {
    return right(input);
  }
}
