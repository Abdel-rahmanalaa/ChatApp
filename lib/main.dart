import 'package:chatapp/bloc/auth_bloc.dart';
import 'package:chatapp/bloc/default_observer.dart';
import 'package:chatapp/screens/chat/chat_screen.dart';
import 'package:chatapp/screens/login/login_screen.dart';
import 'package:chatapp/screens/onBoarding_screen.dart';
import 'package:chatapp/screens/register/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'screens/chat/cubit/chat_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;

  Bloc.observer = DefaultObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        routes: {
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        initialRoute: OnBoardingScreen.id,
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}
