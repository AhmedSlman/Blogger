import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/features/auth/presentation/pages/login_page.dart';
import 'package:blogger/features/auth/presentation/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.signUpPage,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: RouterNames.loginPage,
      builder: (context, state) => const LogInPage(),
    ),
  ],
);
