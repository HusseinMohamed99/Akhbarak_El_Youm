import 'package:akhbarak_el_youm/Core/providers/settings_provider.dart';
import 'package:akhbarak_el_youm/Core/style/theme.dart';
import 'package:akhbarak_el_youm/View/HomeScreen/home_screen.dart';
import 'package:akhbarak_el_youm/View/NewsDetails/news_details.dart';
import 'package:akhbarak_el_youm/View/SearchScreen/search_screen.dart';
import 'package:akhbarak_el_youm/View/Settings/settings_screen.dart';
import 'package:akhbarak_el_youm/View/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  runApp(
    ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(),
      child: Builder(
        builder: (context) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeApp.lightTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.routeName: (_) => const SplashScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            SettingsScreen.routeName: (_) => const SettingsScreen(),
            NewsDetails.routeName: (_) => const NewsDetails(),
            SearchScreen.routeName: (_) => const SearchScreen(),
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
