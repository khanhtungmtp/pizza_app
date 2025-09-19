import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/blocs/authentication_bloc/authentication_bloc_bloc.dart';
import 'package:pizza_app/screens/auth/views/welcome_srceen.dart';
import 'package:pizza_app/screens/home/view/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade200,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      home: BlocBuilder<AuthenticationBlocBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return const HomeScreen();
            // return MultiBlocProvider(providers: [
            //   BlocProvider(create: (context) => SignInBloc())
            // ], child: const HomeScreen());
          } else {
            return const WelcomeSrceen();
          }
        },
      ),
    );
  }
}
