import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../helpers/supabase_helper.dart';

final getIt = GetIt.instance;

Future setupGetIt() async {
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(SupabaseHelper().client),
  );
}
