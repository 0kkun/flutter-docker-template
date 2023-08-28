import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APP_ENV', defaultValue: 'local')
  static const String appEnv = _Env.appEnv;

  @EnviedField(varName: 'API_BASE_URL', defaultValue: 'http://localhost:8000')
  static const String apiBaseUrl = _Env.apiBaseUrl;
}