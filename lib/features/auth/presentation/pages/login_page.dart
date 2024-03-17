import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_header_text.dart';
import '../widgets/have_an_acount.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.errMessage);
          } else if (state is AuthSuccess) {
            customReplacementNavigate(context, RouterNames.blogPage);
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            return const LoaderWidget();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthHeaderTextWidget(
                text: 'Sign In.',
              ),
              const SizedBox(height: 25),
              const LogInFormWidget(),
              HaveAnAcountWidget(
                onTab: () {
                  customReplacementNavigate(context, RouterNames.signUpPage);
                },
                text1: "Don't have an account?  ",
                text2: "Sign Up",
              ),
            ],
          );
        }),
      ),
    );
  }
}
