import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rep_chain_mobile/main.dart';

import 'get_it.config.dart';

const firebase = Environment('firebase');
const supabase = Environment('supabase');
const appwrite = Environment('appwrite');

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => await $initGetIt(
      getIt,
      environment:
          const String.fromEnvironment('PAAS', defaultValue: 'firebase'),
    );
