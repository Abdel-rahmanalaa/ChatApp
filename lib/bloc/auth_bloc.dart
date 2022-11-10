import 'package:chatapp/bloc/auth_event.dart';
import 'package:chatapp/bloc/auth_state.dart';
import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(errorMessage: userNotFound));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(errorMessage: wrongPassword));
          }
        } on Exception catch (e) {
          emit(LoginFailure(errorMessage: somethingWrong));
        }
      }
      if(event is RegisterEvent){
        emit(RegisterLoading());
        try {
          UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'week-password') {
            emit(RegisterFailure(errorMessage: weekPassword));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure(errorMessage: emailAlreadyUse));
          }
        } on Exception catch (e) {
          emit(RegisterFailure(errorMessage: somethingWrong));
        }
      }
    });
  }
}
