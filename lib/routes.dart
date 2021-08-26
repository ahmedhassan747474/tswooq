import 'package:flutter/widgets.dart';
import 'package:tswooq/screens/complete_profile/complete_profile_screen.dart';
import 'package:tswooq/screens/forgot_password/forgot_password_screen.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/screens/otp/otp_screen.dart';
import 'package:tswooq/screens/profile/profile_screen.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
 // OrderSuccessScreen.routeName: (context) => OrderSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
 // CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
