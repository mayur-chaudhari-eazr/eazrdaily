import 'dart:async';
import 'package:eazrdaily/config/theme/app_theme.dart';
import 'package:eazrdaily/core/constants/app_string.dart';
import 'package:eazrdaily/core/utils/window.dart';
import 'package:eazrdaily/features/dashboard/bloc/bottom_nav_cubit.dart';
import 'package:eazrdaily/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // Import provider for theme management

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Add delay if required before running the app
  Future.delayed(const Duration(milliseconds: 1000), () {
    runApp(const EazrDailyApp());
  });
}

class EazrDailyApp extends StatelessWidget {
  const EazrDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Adapt screen size for different devices
    Window().adaptDeviceScreenSize(view: View.of(context));

    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: BlocProvider(
        create: (_) => BottomNavCubit(),
        child: Builder(
          builder: (context) {
            final themeProvider = Provider.of<AppTheme>(context);

            return MaterialApp(
              scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
              theme: AppTheme.lightTheme, 
              darkTheme: AppTheme.darkTheme,
              themeMode: themeProvider.themeMode,
              title: AppString.appName,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(), 
            );
          },
        ),
      ),
    );
  }
}
