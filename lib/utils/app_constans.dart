import 'package:universal_platform/universal_platform.dart';

class App {
  static String get host {
    return (UniversalPlatform.isAndroid) ? '10.0.2.2' : '127.0.0.1';
  }
}
