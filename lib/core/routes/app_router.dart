import 'package:blogger/core/commen/cubits/appUserCubit/app_user_cubit.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/features/auth/presentation/pages/login_page.dart';
import 'package:blogger/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.signUpPage,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: RouterNames.loginPage,
      builder: (context, state) =>
          BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const Scaffold(
              body: Center(
                child: Text("logged in"),
              ),
            );
          }
          return const LogInPage();
        },
      ),
    ),
  ],
);
