import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'env/environmentSettings.dart';

Future main() async {
  var env = EnvironmentSettings(
    // baseApi: "https://localhost:44320",
    baseApi: "https://api.scrapassistant.com",
    donationsEnabled: true,
    isProduction: false,
  );

  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp(env));
}
