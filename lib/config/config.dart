import '../enum/env.dart';

class Config {
  static Env env;

  static String get apiHost {
    print(111);
    print(env);
    switch (env) {
      case Env.PROD:
        return "**";
      case Env.PREPUB:
        return "**";
      case Env.DEVELOP:
        return "**";
      default:
        return "**";
    }
  }
}
