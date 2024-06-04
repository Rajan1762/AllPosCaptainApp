import 'dart:io';
import 'package:captain_app/screens/home_screen/home_main_screen.dart';
import 'package:captain_app/screens/profile_screens/login_screen.dart';
import 'package:captain_app/services/provider_services/bottom_provider.dart';
import 'package:captain_app/services/provider_services/floor_table_provider_service.dart';
import 'package:captain_app/services/provider_services/order_provider.dart';
import 'package:captain_app/services/provider_services/product_provider_service.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _getSharedPrefValue();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    HttpOverrides.global = MyHttpOverrides();
    runApp(const MyApp());
  });
}

Future<void> _getSharedPrefValue() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  kOrganizationCodeVal = prefs.getString(kOrganizationCode) ?? "";
  kEmployeeCodeVal = prefs.getString(kEmployeeCode) ?? "";
  kEmployeeNameVal = prefs.getString(kEmployeeName) ?? "";
  kIsCaptainVal = prefs.getString(kIsCaptain) ?? "";
  kAuthTokenVal = prefs.getString(kAuthToken) ?? "";
  kBranchCodeVal = prefs.getString(kBranchCodeString) ?? "";
  kTillVal = prefs.getString(kTillString) ?? "";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => ProductProviderService()),
        ChangeNotifierProvider(create: (context) => FloorTableProviderService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: appThemeColor,
                foregroundColor: Colors.white),
            scaffoldBackgroundColor: scaffoldBgColor,
            colorScheme: ColorScheme.fromSeed(seedColor: appThemeColor),
            useMaterial3: true,
          ),
          home: kEmployeeCodeVal == ''
              ? const LoginScreen()
              : const HomeMainScreen()),
    );
  }
}
