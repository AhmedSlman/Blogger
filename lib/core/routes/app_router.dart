import 'package:blogger/core/commen/cubits/appUserCubit/app_user_cubit.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/features/auth/presentation/pages/login_page.dart';
import 'package:blogger/features/auth/presentation/pages/sign_up_page.dart';
import 'package:blogger/features/blog/presentation/pages/add_new_blog_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/blog/presentation/pages/blog_page.dart';

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
            return const BlogPage();
          }
          return const LogInPage();
        },
      ),
    ),
    GoRoute(
      path: RouterNames.blogPage,
      builder: (context, state) => const BlogPage(),
    ),
    GoRoute(
      path: RouterNames.addNewBlogPage,
      builder: (context, state) => const AddNewBlogPage(),
    ),
  ],
);
