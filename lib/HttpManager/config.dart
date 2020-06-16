enum Env {
  PROD,
  DEVELOP,
  PREPUB,
}

class Config {
  static Env env;

  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return "https://www.baidu.com";
      case Env.PREPUB:
        return "";
      case Env.DEVELOP:
        return "";
      default:
        return "";
    }
  }
}
