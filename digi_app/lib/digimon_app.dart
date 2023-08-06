import 'package:digi_app/services/index.dart';

import 'package:flutter/material.dart';
import 'package:digi_app/screens/index.dart';
import 'package:provider/provider.dart';

import 'widgets/index.dart';

class DigimonApp extends StatefulWidget {
  
  const DigimonApp({Key? key}) : super (key: key);

  @override
  State<DigimonApp> createState() => DigimonAppState();
}

class DigimonAppState extends State<DigimonApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProspectoTypeService('', ''),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AutenticacionService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DigimonService(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        builder: (varContext, varChild) {
            return MaxScaleTextWidget(
              max: 1.0,
              child: varChild,
            );
          },
          debugShowCheckedModeBanner: false,
          title: '',
          initialRoute: CheckAuthScreen.routerName,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: messengerKey,
          home: PrincipalScreen(),
          theme: ThemeData(
            primaryColor: Colors.black,
            appBarTheme: const AppBarTheme(
              color: Colors.black,
            ),
          ),
          routes: {
            AuthenticationScreen.routerName: (_) => const AuthenticationScreen(),
            AutenticacionErrorScreen.routerName: (_) => AutenticacionErrorScreen(null,'', '','',false,false,'',''),
            CheckAuthScreen.routerName: (_) => const CheckAuthScreen(),
            RegistroUsuarioScreen.routerName: (_) => RegistroUsuarioScreen(),
            ContraseniaScreen.routerName: (_) => ContraseniaScreen(correoUser: ''),
          }
      ),
    );
  }
}