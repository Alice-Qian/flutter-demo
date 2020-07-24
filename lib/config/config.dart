
enum Env {
  PROD,
  DEVELOP,
  PREPUB,
}

class Config  {
  static Env env;

  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return "https://groot.24che.com";
      case Env.PREPUB:
        return "https://groot.24che.com";
      case Env.DEVELOP:
        return "https://groot.24che.com";
      default:
        return "https://groot.24che.com";
    }
  }
}
