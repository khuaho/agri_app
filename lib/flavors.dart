enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Agri App DEV';
      case Flavor.prod:
        return 'Agri App';
      default:
        return 'title';
    }
  }
}
