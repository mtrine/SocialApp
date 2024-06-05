import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_network/src/components/LifecycleEventHandler.dart';
import 'package:social_network/src/services/userServices.dart';
import 'package:social_network/src/utils/constant.dart';
import 'package:social_network/src/utils/provider.dart';
import 'package:social_network/src/view_models/theme/themeViewModel.dart';

import 'landing/landingPage.dart';
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    LifcycleEventHandler(
      detachedCallBack: ()=>UserServices().setUserStatus(false),
      resumeCallBack: ()=>UserServices().setUserStatus(true),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child:Consumer<ThemeProvider>(
              builder: (context,ThemeProvider notifier,Widget? child){
                  return MaterialApp(
                    title: Constants.appName,
                    debugShowCheckedModeBanner: false,
                    theme:themeData(
                      notifier.dark?Constants.darkTheme:Constants.lightTheme
                    ),
                    home: StreamBuilder(
                      stream:FirebaseAuth.instance.authStateChanges(),
                      builder:(context,snapshot){
                        if(snapshot.hasData){
                          return LandingPage();
                        }else{
                          return LandingPage();
                        }
                      }
                    ),
                  );
              },
        )
    );

  }

  ThemeData themeData(ThemeData theme){
    return theme.copyWith(
      textTheme:GoogleFonts.nunitoTextTheme(
        theme.textTheme

      )
    );
  }
}
