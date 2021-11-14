import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/components/custom_surfix_icon.dart';
import 'package:tswooq/components/form_error.dart';
import 'package:tswooq/components/loading_screen.dart';
import 'package:tswooq/screens/forgot_password/forgot_password_screen.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future<void> _submit() async {
    _formKey.currentState.validate();
    try {
      print('0000000000000000000000000000');
      if (_formKey.currentState.validate()) {
        print('111111111111111111111');
        _formKey.currentState.save();
        LoadingScreen.show(context);
        await ApiProvider.instance.login(email, password);

        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on ApiException catch (_) {
      print('ApiException');
      Navigator.of(context).pop();
      ServerConstants.showDialog1(context, _.toString());
    } on DioError catch (e) {
      //<<<<< IN THIS LINE
      print(
          "e.response.statusCode    ////////////////////////////         DioError");
      if (e.response.statusCode == 400) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        // print(e.request);
      }
    } catch (e) {
      print('catch');
      print(e);

      Navigator.of(context).pop();
      ServerConstants.showDialog1(context, e.toString());
    } finally {
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              SizedBox(),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  LocaleKeys.forget_password_translate.tr(),
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: LocaleKeys.continue_translate.tr(),
            press: _submit,
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      initialValue: "123456789",
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.password_translate.tr(),
        hintText: LocaleKeys.password_hint.tr(),
        labelStyle: TextStyle(color: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: "test@gmail.com",
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      // style: TextStyle(fontSize: 20.0, color: Colors.redAccent),

      decoration: InputDecoration(
        labelText: LocaleKeys.email_translate.tr(),
        labelStyle: TextStyle(color: kPrimaryColor),
        hintText: LocaleKeys.email_hint_translate.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
