import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../helpers/supabase_helper.dart';

final getIt = GetIt.instance;

Future setupGetIt() async {
  // auth repo
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(SupabaseHelper().client),
  );

  // profile repo
  getIt.registerLazySingleton<ProfileRepoImpl>(
    () => ProfileRepoImpl(SupabaseHelper().client),
  );
}
