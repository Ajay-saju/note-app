// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ddd/domain/auth/auth_failure.dart';
import 'package:ddd/domain/auth/value_objects.dart';

import '../../../domain/auth/i_auth_facade.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  // SignInFormBloc(this._authFacade);

  // @override
  // SignInFormState get initialState => SignInFormState.initial();

  // @override
  // Stream<SignInFormState> mapEventToState(
  //   SignInFormEvent event,
  // ) async* {
  //   // TODO: Implement
  // }

  SignInFormBloc(
    this._authFacade,
  ) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      event.map(emailChanged: (e) async* {
        yield state.copyWith(
            emailAddress: EmailAddress(e.emailAddress),
            authFailureOrSuccessOption: none());
      }, 
      passwordChanged: (e) async* {
        yield state.copyWith(
            password: PassWord(e.password), authFailureOrSuccessOption: none());
      },
       registerWithEmailAndPasswordPressed: (e) async* {
        yield* __performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.registerWithEmailAndPassword,
        );
      }, signInWithEmailAndPasswordPressed: (e) async* {

        yield* __performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.sighInWithEmailAndPassword,
        );
        // late Either<AuthFailure, Unit>
        //     failureOrSuccess; // if get any error check this line.
        // final isEmaiValid = state.emailAddress.isValid();
        // final isPasswordValid = state.password.isValid();
        // if (isEmaiValid && isPasswordValid) {
        //   yield state.copyWith(
        //       isSubmitting: true, authFailureOrSuccessOption: none());

        //   failureOrSuccess = await _authFacade.sighInWithEmailAndPassword(
        //       emailAddress: state.emailAddress, password: state.password);
        // }
        // yield state.copyWith(
        //     showErrorMessages: true,
        //     isSubmitting: false,
        //     authFailureOrSuccessOption: optionOf(failureOrSuccess));
      }, signInWithGooglePressed: (e) async* {
        yield state.copyWith(
            isSubmitting: true, authFailureOrSuccessOption: none());
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess));
      });
    });
  }
  Stream<SignInFormState> __performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required PassWord password,
    }) forwardedCall,
  ) async* {
    late Either<AuthFailure, Unit>
        failureOrSuccess; // if get any error check this line.
    final isEmaiValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmaiValid && isPasswordValid) {
      yield state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await forwardedCall(
          emailAddress: state.emailAddress, password: state.password);
    }
    yield state.copyWith(
        showErrorMessages: true,
        isSubmitting: false,
        authFailureOrSuccessOption: optionOf(failureOrSuccess));
  }
}
