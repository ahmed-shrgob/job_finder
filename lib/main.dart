import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:job_finder/core/view%20model/filterVM.dart';
import 'package:job_finder/core/view%20model/followVM.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view/screens/loginScreen.dart';
import 'package:job_finder/core/view/screens/main_screen.dart';
import 'package:job_finder/core/view/screens/test.dart';
import 'package:job_finder/helper/company_dropdown_providr.dart';
import 'package:job_finder/helper/job_dropdown_providr.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/view model/cv_VM.dart';

void main() async {
  await GetStorage.init();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeAppSize(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CVVM>(
          create: (_) => CVVM(),
        ),
        ChangeNotifierProvider<FilterVM>(
          create: (_) => FilterVM(),
        ),
        ChangeNotifierProvider<JobVM>(
          create: (_) => JobVM(),
        ),
        ChangeNotifierProvider<FollowVM>(
          create: (_) => FollowVM(),
        ),
        ChangeNotifierProvider<CompanyDropdownValueProvider>(
          create: (_) => CompanyDropdownValueProvider(),
        ),
        ChangeNotifierProvider<JobDropdownValueProvider>(
          create: (_) => JobDropdownValueProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainScreen(),
        // home: FilterScreen1(),
        home: userId == null ? LoginScreen() : MainScreen(),
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ar'),
      ),
    );
  }
}
