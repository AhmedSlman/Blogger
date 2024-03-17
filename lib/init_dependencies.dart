import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:blogger/core/commen/cubits/appUserCubit/app_user_cubit.dart';
import 'package:blogger/core/network/connection_checker.dart';
import 'package:blogger/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blogger/features/auth/data/repository/auth_repository_imple.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';
import 'package:blogger/features/auth/domain/usecases/current_user.dart';
import 'package:blogger/features/auth/domain/usecases/user_login.dart';
import 'package:blogger/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blogger/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blogger/features/blog/data/datasources/blog_local_data_source.dart';
import 'package:blogger/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blogger/features/blog/data/repository/blog_repository_imple.dart';
import 'package:blogger/features/blog/domain/repository/blog_repository.dart';
import 'package:blogger/features/blog/domain/usecase/get_all_blogs.dart';
import 'package:blogger/features/blog/domain/usecase/uploade_blog.dart';
import 'package:blogger/features/blog/presentation/bloc/blog_bloc.dart';

import 'core/utils/app_constants.dart';

part 'init_dependencies.main.dart';
