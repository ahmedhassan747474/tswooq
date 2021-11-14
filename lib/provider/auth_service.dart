import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_exception.dart';

export 'package:provider/provider.dart';

class AuthService with ChangeNotifier {
  ApiProvider _api = ApiProvider.instance;
  UserModel userModel;
  String titleAddresses;

  bool get isAuth => userModel != null;

  Future<bool> autoLogin() async {
    // Just to show Splash Screen for couple of seconds
    print('autoLogin()');
    await Future.delayed(Duration(seconds: 1));
    //
    if (userModel != null) return true;
    //
    print(' (userModel != null)');
    bool isLoggedIn = await UserModel().isLoggedIn;
    //
    print(' isLoggedIn  false');
    if (!isLoggedIn) return false;
    //
    print('(!isLoggedIn) return false;');
    try {
      print(' autoLogin()  try');
      userModel = await _api.getProfile();
//      await _logoutIfNotActive();
      // _autoLogout();
      return true;
    } on ApiException catch (_) {
      await UserModel().resetUser();
      userModel = null;
      return false;
    } on SocketException catch (_) {
      return false;
    } catch (e) {
//      Crashlytics.instance.recordError(
//        "Manuel Report ${e.toString()}",
//        stackTrace,
//      );
      return false;
    } finally {
      notifyListeners();
    }
  }

  /// get user address
  // Future<void> getUserAddress() async {
  //   print("execute getAddress");
  //
  //   final temp = await LocationService.getLatLng();
  //   // print("temp.longitude ${temp.longitude}");
  //   // print("temp.latitude ${temp.latitude}");
  //   latitude = temp.latitude;
  //   longitude = temp.longitude;
  //   addresses = await LocationService.getLocation();
  //   titleAddresses = addresses[0].addressLine;
  //   notifyListeners();
  // }

  // Future<void> editUserData(
  //     {UserModel user, XFile image, BuildContext context}) async {
  //   userModel = await ApiProvider.instance
  //       .editUserData(image: image, userModel: user, context: context);
  //   notifyListeners();
  // }

  Future<void> login(String phone, String password, String t) async {
    userModel = await ApiProvider.instance.login(phone, password);
    notifyListeners();
  }

  // Future<void> loginFb({UserModel user, String token}) async {
  //   userModel = await ApiProvider.instance.loginFB(user, token);
  //   notifyListeners();
  // }

  // Future<String> changePassword(
  //     {String currentPass, String newPass, String confirmPass}) async {
  //   return await ApiProvider.instance.changePassword(
  //       name: userModel.name,
  //       email: userModel.email,
  //       currentPass: currentPass,
  //       newPass: newPass,
  //       confirmPass: confirmPass);
  // }

  Future<void> logout() async {
    await userModel?.resetUser();
    userModel = null;
//    _timer?.cancel();

    notifyListeners();
  }
}
