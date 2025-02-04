import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/updata_model.dart';
import 'package:tswooq/screens/cart/cart_screen.dart';
import 'package:tswooq/screens/favorite/favorite_screen.dart';
import 'package:tswooq/screens/profile/profile_screen.dart';
import 'package:tswooq/screens/vendors/vendors_group.dart';
import 'package:tswooq/utils/api.dart';

import '../../constants.dart';
import '../../models/vendors_model.dart';
import '../../size_config.dart';
import 'components/search_field.dart';

int selectedIndexHome = 0;

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Update update = new Update(num: 1);
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    update = await ApiProvider.instance.checkUpdate();
    if (update.num > 1)
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: _onWillPop,
          child: new CupertinoAlertDialog(
            title: new Text(
              'please update',
              // CodegenLoader.exit.tr(),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  // print(Platform.isAndroid);
                  // print(update.android);
                  // print(update.ios);
                  helpLauncher(
                      Platform.isAndroid ? update.android : update.ios);
                },
                child: new Text(
                  'update',
                ),
              ),
            ],
          ),
        ),
      );

    if (mounted) setState(() {});
  }

  var _pages = [
    VendorGroupScreen(Vendor(name: "قمر للاتصالات", id: 32)),
    CartScreen(),
    // VendorsScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new CupertinoAlertDialog(
            title: new Text(
              'exit',
              // CodegenLoader.exit.tr(),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  'no',
                ),
              ),
              new FlatButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: new Text(
                  'yes',
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  Widget titleMain(String string, Widget w, Function f) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: f,
        child: helpClip(
            10,
            Container(
              height: 40,
              color: Color(0xFF143444),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  w,
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    string,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: kIsWeb
            ? AppBar(
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: helpWidth(context) > 600 ? 70 : 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -15),
                          blurRadius: 20,
                          color: Color(0xFFDADADA).withOpacity(0.15),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SafeArea(
                        top: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (kIsWeb)
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/logo.png",
                                ),
                              ),
                            titleMain(
                              helpEn(context) ? "Home" : "الرئيسية",
                              SvgPicture.asset(
                                "assets/icons/Shop Icon.svg",
                                color: selectedIndexHome == 0
                                    ? Colors.white
                                    : Colors.white,
                              ),
                              () => setState(() {
                                selectedIndexHome = 0;
                              }),
                            ),
                            titleMain(
                              helpEn(context) ? "Cart" : "السلة",
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: selectedIndexHome == 1
                                    ? Colors.white
                                    : Colors.white,
                              ),
                              () => setState(() {
                                selectedIndexHome = 1;
                              }),
                            ),
                            // titleMain(
                            //   helpEn(context) ? "Shops" : "المتاجر",
                            //   SvgPicture.asset(
                            //     "assets/icons/vendor.svg",
                            //     color: selectedIndexHome == 2
                            //         ? Colors.white
                            //         : Colors.white,
                            //   ),
                            //   () => setState(() {
                            //     selectedIndexHome = 2;
                            //   }),
                            // ),
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/Heart Icon.svg",
                                color: selectedIndexHome == 2
                                    ? kPrimaryColor
                                    : inActiveIconColor,
                              ),
                              onPressed: () => setState(() {
                                selectedIndexHome = 2;
                              }),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                "assets/icons/User Icon.svg",
                                color: selectedIndexHome == 3
                                    ? kPrimaryColor
                                    : inActiveIconColor,
                              ),
                              onPressed: () => setState(() {
                                selectedIndexHome = 3;
                              }),
                            ),
                            Spacer(),
                            SearchField(),
                            if (!kIsWeb)
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/logo.png",
                                ),
                              ),
                            Spacer(),
                          ],
                        )),
                  ),
                ),
              )
            : null,
        // body: VendorGroupScreen(Vendor(name: "قمر اتصالات", id: 32)),
        body: _pages[selectedIndexHome],
        bottomNavigationBar: kIsWeb
            ? SizedBox()
            : Container(
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  // color: AppColors.PRIMARY_COLOR,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 20,
                      color: Color(0xFFDADADA).withOpacity(0.15),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SafeArea(
                    top: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/Shop Icon.svg",
                            color: selectedIndexHome == 0
                                ? kPrimaryColor
                                : inActiveIconColor,
                          ),
                          onPressed: () => setState(() {
                            selectedIndexHome = 0;
                          }),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: selectedIndexHome == 1
                                ? kPrimaryColor
                                : inActiveIconColor,
                          ),
                          onPressed: () => setState(() {
                            selectedIndexHome = 1;
                          }),
                        ),
                        // IconButton(
                        //   icon: SvgPicture.asset(
                        //     "assets/icons/vendor.svg",
                        //     color: selectedIndexHome == 2
                        //         ? kPrimaryColor
                        //         : inActiveIconColor,
                        //   ),
                        //   onPressed: () => setState(() {
                        //     selectedIndexHome = 2;
                        //   }),
                        // ),
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/Heart Icon.svg",
                            color: selectedIndexHome == 2
                                ? kPrimaryColor
                                : inActiveIconColor,
                          ),
                          onPressed: () => setState(() {
                            selectedIndexHome = 2;
                          }),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/icons/User Icon.svg",
                            color: selectedIndexHome == 3
                                ? kPrimaryColor
                                : inActiveIconColor,
                          ),
                          onPressed: () => setState(() {
                            selectedIndexHome = 3;
                          }),
                        ),
                      ],
                    )),
              ),
      ),
    );
  }
}

// الاسم الاول
// الاسم التانى
// سجل تجارى
// اسم تجارى
// الدوماين
// حساب
// رقم ضريبى
// العنوان
