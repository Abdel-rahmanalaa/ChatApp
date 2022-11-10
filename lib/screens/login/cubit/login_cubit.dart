import 'package:chatapp/screens/login/cubit/login_states.dart';
import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
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
}
