import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/presentation/screens/login_screen.dart';
import 'package:ghaith_test/providers/password_visibility_provider.dart';
import 'package:ghaith_test/providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(1440, 3200),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.whitecolor,
              primaryColor: ColorsManager.primary,
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
