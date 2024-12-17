import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/app_bindings.dart';
import 'screens/login_screen.dart';
import 'screens/guest_dashboard/guest_dashboard.dart';
import 'screens/legal_dashboard/legal_dashboard.dart';
import 'screens/judicial_dashboard/judicial_dashboard.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() {
  // Ensure Flutter widgets are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bail Reckoner',
      initialBinding: AppBindings(),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/guest_dashboard', page: () => const GuestDashboard()),
        GetPage(
            name: '/legal_aid_dashboard',
            page: () => const LegalAidDashboard()),
        GetPage(
            name: '/judicial_dashboard', page: () => const JudicialDashboard()),
      ],
    );
  }
}
