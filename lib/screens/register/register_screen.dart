import 'package:chatapp/bloc/auth_bloc.dart';
import 'package:chatapp/bloc/auth_event.dart';
import 'package:chatapp/bloc/auth_state.dart';
import 'package:chatapp/screens/chat/chat_screen.dart';
import 'package:chatapp/shared/componets/consts/colors.dart';
import 'package:chatapp/shared/componets/consts/texts.dart';
import 'package:chatapp/shared/componets/images.dart';
import 'package:chatapp/shared/componets/widgets/custom_text_field.dart';
import 'package:chatapp/shared/componets/widgets/default_button.dart';
import 'package:chatapp/shared/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatelessWidget {
  static String id = 'RegisterScreen';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state){
        if(state is RegisterLoading){
          isLoading = true;
        }else if(state is RegisterSuccess){
          Navigator.pushNamed(context, ChatScreen.id);
          isLoading = false;
        }else if(state is RegisterFailure){
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: false,
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 50,
            ),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Image.asset(
                    loginsImage,
                    height: 300,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Text(
                            signupText,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: whiteColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: emailText,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomFormTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: passwordText,
                        hiddenText: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      defaultButton(
                        function: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                              RegisterEvent(email: email!, password: password!)
                            );
                          }
                        },
                        text: signupText,
                        backgroundColor: whiteColor,
                        textColor: primaryColor,
                        isUpperCase: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            reminderLoginText,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: whiteColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              loginText,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
