import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tswooq/components/default_button.dart';
import 'package:tswooq/components/form_error.dart';
import 'package:tswooq/components/loading_screen.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/payment_method.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/screens/order_success/login_success_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/api_order.dart';
import 'package:tswooq/utils/contents.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OrderForm extends StatefulWidget {
  final double totalPrice;

  const OrderForm({Key key, @required this.totalPrice}) : super(key: key);
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  UserModel user = new UserModel();
  final _formKey = GlobalKey<FormState>();
  String email, phone, address, comments, city, nOFBank;
  bool remember = false;
  final List<String> errors = [];
  XFile tmpFile;

  bool showNawImage = false;
  PaymentMethodModel method = new PaymentMethodModel(data: []);
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    user = ApiProvider.user;
    _initData();
  }

  _initData() async {
    method = await ApiOrder.instance.getMethod();

    _isLoading = false;
    if (mounted) setState(() {});
  }

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

  String selectedValue = LocaleKeys.Cash.tr();

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
        await ApiOrder.instance.makeOrder(
          phone: phone,
          email: email,
          city: city,
          address: address,
          // selectedValue,
          totalPrice: widget.totalPrice,
          comments: comments, bankNumber: nOFBank,
          image: selectedValue == LocaleKeys.Cash.tr()
              ? File("")
              : File(tmpFile.path),
          paymentMethod: selectedValue == LocaleKeys.Cash.tr()
              ? "cash_on_delivery"
              : 'bank_account',
        );

        Navigator.of(context).popUntil((route) => route.isFirst);

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
      }

      //   }
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
      Navigator.of(context).pop();
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
          buildCityFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: 30),
          buildPhoneFormField(),
          SizedBox(height: 30),
          buildCommentsFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Text(
              LocaleKeys.Payment_Method.tr(),
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          ListTile(
            title: Text(LocaleKeys.Cash.tr()),
            leading: Radio(
              value: LocaleKeys.Cash.tr(),
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
          ),
          _isLoading
              ? SizedBox()
              : method.data[8].active == 0
                  ? SizedBox()
                  : ListTile(
                      title: Text(
                        LocaleKeys.Bank.tr(),
                      ),
                      leading: Radio(
                        value: LocaleKeys.Bank.tr(),
                        groupValue: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                      ),
                    ),
          selectedValue == LocaleKeys.Bank.tr()
              ? InkWell(
                  onTap: () {
                    choseImage(ImageSource.gallery);
                    showNawImage = true;
                    setState(() {});
                  },
                  child: Center(
                    child: Container(
                      height: helpHeight(context) * 0.14,
                      width: helpWidth(context) * 0.31,
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
                )
              : SizedBox(),
          selectedValue == LocaleKeys.Bank.tr()
              ? buildNOFBankFormField()
              : SizedBox(),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: LocaleKeys.continue_translate.tr(),
            press: _submit,
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        address = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.Address_translate.tr(),
        hintText: LocaleKeys.Address_hint.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildCityFormField() {
    return TextFormField(
      onSaved: (newValue) => city = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        city = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.City.tr(),
        hintText: LocaleKeys.City_hint.tr(),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildCommentsFormField() {
    return TextFormField(
      onSaved: (newValue) => comments = newValue,
      maxLines: 4,
      decoration: InputDecoration(
        labelText: LocaleKeys.comments.tr(),
        hintText: LocaleKeys.comments.tr(),
      ),
    );
  }

  TextFormField buildNOFBankFormField() {
    return TextFormField(
      onSaved: (newValue) => nOFBank = newValue,
      decoration: InputDecoration(
        labelText: LocaleKeys.NOFBank.tr(),
        hintText: LocaleKeys.NOFBank.tr(),
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
          addError(error: kShortPhoneError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.Phone.tr(),
        hintText: LocaleKeys.Phone_hint.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
