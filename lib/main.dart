import 'package:akhbarak_el_youm/View/Desktop/desktop_screen.dart';
import 'package:akhbarak_el_youm/Core/providers/settings_provider.dart';
import 'package:akhbarak_el_youm/Core/style/theme.dart';
import 'package:akhbarak_el_youm/View/Mobile/HomeScreen/home_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/NewsDetails/news_details.dart';
import 'package:akhbarak_el_youm/View/Mobile/SearchScreen/search_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/Settings/settings_screen.dart';
import 'package:akhbarak_el_youm/View/Mobile/SplashScreen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( ChangeNotifierProvider(
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
  ),);
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 late SettingsProvider settingsProvider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
   // getValueFromPref();
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(

            // localizationsDelegates: const [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: AppLocalizations.supportedLocales,
            // locale: Locale(settingsProvider.currentLanguage),

            ///OR
            // supportedLocales: const [
            //   Locale('en', ''), // English, no country code
            //   Locale('ar', ''), // Spanish, no country code
            // ],
            theme: ThemeApp.lightTheme,


            debugShowCheckedModeBanner: false,

            home: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (kDebugMode) {
                    print(constraints.minWidth.toInt());
                  }
                  if (constraints.minWidth.toInt() <= 500) {
                    return  HomeScreen();
                  }
                  return const DesktopScreen();
                }),

            routes: {

              SplashScreen.routeName: (_) => const SplashScreen(),
              HomeScreen.routeName: (_) =>  HomeScreen(),
              SettingsScreen.routeName: (_) => const SettingsScreen(),
             NewsDetails.routeName: (_) => const NewsDetails(),
               SearchScreen.routeName: (_) => const SearchScreen(),
              DesktopScreen.routeName: (_) => const DesktopScreen(),
            },
            initialRoute:  SplashScreen.routeName,
          );
        });
  }

  getValueFromPref() async {
    final pref = await SharedPreferences.getInstance();
    settingsProvider.changeLanguage(pref.getString("Lang") ?? "en");
    }
  }

