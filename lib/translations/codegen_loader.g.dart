// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "continue_translate": "استمرار",
  "sign_in_translate": "تسجيل الدخول",
  "welcome_translate": "مرحبا",
  "email_translate": "ايميل",
  "password_translate": "باسورد",
  "remember_translate": "تذكرني",
  "forget_password_translate": "نسيت الباسورد",
  "sign_up_translate": "انشاء حساب",
  "Don't_have_an_account?_translate": "ليس لديك حساب؟",
  "Brands_translate": "برندات",
  "Popular_Products_translate": "منتجات شائعة",
  "See_More_translate": "المزيد",
  "Search_Product_translate": "ابحث عن منتج"
};
static const Map<String,dynamic> en = {
  "continue_translate": "Continue",
  "sign_in_translate": "Sign in",
  "welcome_translate": "Welcome Back",
  "email_translate": "Email",
  "password_translate": "Password",
  "remember_translate": "Remember me",
  "forget_password_translate": "Forget password",
  "sign_up_translate": "Sign Up",
  "Don't_have_an_account?_translate": "Don't have an account?",
  "Brands_translate": "Brands",
  "Popular_Products_translate": "Popular Products",
  "See_More_translate": "See More",
  "Search_Product_translate": "Search Product"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
