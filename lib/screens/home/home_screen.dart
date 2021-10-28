import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/screens/cart/cart_screen.dart';
import 'package:tswooq/screens/favorite/favorite_screen.dart';
import 'package:tswooq/screens/profile/profile_screen.dart';
import 'package:tswooq/screens/vendors/vendors.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';

int selectedIndexHome = 0;

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _pages = [
    Body(),
    CartScreen(),
    VendorsScreen(),
    FavoriteScreen(),
    // OrderListScreen(),
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
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text(
                  'yes',
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _pages[selectedIndexHome],
        bottomNavigationBar: Container(
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
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/vendor.svg",
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
                      "assets/icons/Heart Icon.svg",
                      color: selectedIndexHome == 3
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => setState(() {
                      selectedIndexHome = 3;
                    }),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/User Icon.svg",
                      color: selectedIndexHome == 4
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () => setState(() {
                      selectedIndexHome = 4;
                    }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
