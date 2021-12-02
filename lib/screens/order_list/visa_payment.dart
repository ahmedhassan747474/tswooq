import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tswooq/components/loading_screen.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/screens/order_success/login_success_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/api_order.dart';
import 'package:tswooq/utils/contents.dart';
import 'package:tswooq/utils/vars.dart';

import '../../constants.dart';

class VisaPayment extends StatefulWidget {
  final double totalPrice;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String method;

  const VisaPayment(
      {Key key,
      @required this.totalPrice,
      @required this.email,
      @required this.phone,
      @required this.city,
      @required this.address,
      @required this.method})
      : super(key: key);

  @override
  _VisaPaymentState createState() => _VisaPaymentState();
}

class _VisaPaymentState extends State<VisaPayment> {
  final _formKey = GlobalKey<FormState>();
  String bankAccountNam;
  XFile tmpFile;

  bool showNawImage = false;
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

  Future<void> _submit() async {
    _formKey.currentState.validate();
    try {
      print('0000000000000000000000000000');
      if (_formKey.currentState.validate()) {
        print('111111111111111111111');
        _formKey.currentState.save();
        LoadingScreen.show(context);
        await ApiOrder.instance.makeOrderByVisa(
            widget.phone,
            widget.email,
            widget.city,
            widget.address,
            widget.method,
            widget.totalPrice,
            bankAccountNam,
            File(tmpFile.path));

        Navigator.of(context).popUntil((route) => route.isFirst);
        // if(selectedValue.compareTo(LocaleKeys.Cash.tr())==0)
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
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
                child: buildBankAccountFormField(),
              ),
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
                    color: kPrimaryColor,
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

  TextFormField buildBankAccountFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => bankAccountNam = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kBankAccountNullError);
        }
        bankAccountNam = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kBankAccountNullError);
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
}
