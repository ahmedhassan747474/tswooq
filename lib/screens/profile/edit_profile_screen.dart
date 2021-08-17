import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/helper/help.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api.dart';
import 'package:shop_app/utils/api_exception.dart';
import 'package:shop_app/utils/contents.dart';
import 'package:shop_app/utils/vars.dart';

import '../../constants.dart';
import '../../size_config.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  UserModel user = new UserModel();
  String firstName;
  String lastName;
  String userName;
  String email;
  String phone;
  XFile tmpFile;

  bool showNawImage = false;

  choseImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    tmpFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: ImageConfig.QUALITY,
      maxWidth: ImageConfig.WIDTH,
      maxHeight: ImageConfig.HEIGHT,
    );
    setState(() {});
  }

  bool showPassword = false;
  final List<String> errors = [];

  @override
  void initState() {
    user = ApiProvider.user;
  }

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
        //  LoadingScreen.show(context);
        await ApiProvider.instance
            .editProfile(phone, tmpFile, userName, firstName, lastName, email);

        Navigator.of(context).popUntil((route) => route.isFirst);
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
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
        //  print(e.request);
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          LocaleKeys.Edit_Profile_translate.tr(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              //  color: Colors.green,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  choseImage(ImageSource.gallery);
                  showNawImage = true;
                  setState(() {});
                },
                child: Center(
                  child: Container(
                    height: height * 0.14,
                    width: width * 0.31,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: tmpFile != null
                          ? Image.file(File(tmpFile.path))
                          : Container(
                              width: 100,
                              height: 100,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    child: helpImage("_userInfo.avatar", 50),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: kColorAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black87,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildUserNameFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildFirstNameFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildLastNameFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildEmailFormField(),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      buildPhoneFormField(),
                    ],
                  )),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(LocaleKeys.CANCEL_translate.tr(),
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submit();
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      LocaleKeys.SAVE_translate.tr(),
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      initialValue: user.data.firstName,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        firstName = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.First_Name_translate.tr(),
        hintText: LocaleKeys.Enter_your_First_Name_translate.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      initialValue: user.data.lastName,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        lastName = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.Last_Name_translate.tr(),
        hintText: LocaleKeys.Last_Name_hint.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      initialValue: user.data.name,
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        userName = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.User_Name.tr(),
        hintText: LocaleKeys.User_Name_hint.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      initialValue: user.data.phone,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 11) {
          removeError(error: kShortPassError);
        }
        phone = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 11) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.Phone.tr(),
        hintText: LocaleKeys.Phone_hint.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: user.data.email,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
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
      decoration: InputDecoration(
        labelText: LocaleKeys.email_translate.tr(),
        hintText: LocaleKeys.email_hint_translate.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
