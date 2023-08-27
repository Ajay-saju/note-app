// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ddd/domain/core/failures.dart';
import 'package:ddd/domain/core/value_objects.dart';
import 'package:ddd/domain/core/value_validators.dart';




class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    // assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value); 
}

class PassWord extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory PassWord(String input) {
    // assert(input != null);
    return PassWord._(
      validatePassword(input),
    );
  }

  const PassWord._(this.value); 
}


// class InvalidEmailException implements Exception {
//   final String faildValue;

//   InvalidEmailException({required this.faildValue});
// }



// void showingtheEmailAddressOrFailure() {
//   final emailAddress = EmailAddress('kadjfio');
//   String emailText = emailAddress.value.fold(
//       (left) => 'Failure happend, more precisely: $left', (right) => right);
// }
