
import 'package:fashionapp/pages/home.dart';
import 'package:fashionapp/pages/login.dart';
import 'package:fashionapp/pages/splash.dart';
import 'package:fashionapp/provider.dart/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create:(_) => UserProvider.initalize(),
   child:MaterialApp(
    theme: ThemeData(primaryColor:Colors.red.shade900),
    home: ScreenController(),
    debugShowCheckedModeBanner: false,
  ))
    
  );
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
   switch(user.status){
     case Status.Uninitialized: 
     return Splash();
     case Status.Unauthenticated:
     case Status.Authenticating:
      return Login();
      case Status.Authenticated:
      return HomePage();
      default:return Login();
   }
  }
}

