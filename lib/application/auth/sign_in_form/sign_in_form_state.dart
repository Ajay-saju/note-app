part of 'sign_in_form_bloc.dart';

@freezed
abstract class  SignInFormState with _$SignInFormState {
  const factory SignInFormState({
       required EmailAddress emailAddress,
    required PassWord password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  })= _SignInFormState;

   factory SignInFormState.initial() => SignInFormState(emailAddress: EmailAddress(''), password: PassWord(''), showErrorMessages: false, isSubmitting: false, authFailureOrSuccessOption: none());
}
