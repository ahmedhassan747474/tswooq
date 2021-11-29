import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/screens/home/components/search_field.dart';
import 'package:tswooq/screens/home/qr.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!kIsWeb)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                helpClip(
                    10,
                    Container(
                      color: Color(0xFF143444),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            helpEn(context) ? "shipping cards" : "كروت شحن",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    )),
                // IconButton(
                //   icon: SvgPicture.asset(
                //     "assets/icons/Shop Icon.svg",
                //     color: selectedIndexHome == 0
                //         ? kPrimaryColor
                //         : inActiveIconColor,
                //   ),
                //   onPressed: () => setState(() {
                //     selectedIndexHome = 0;
                //   }),
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.shopping_cart_outlined,
                //     color: selectedIndexHome == 1
                //         ? kPrimaryColor
                //         : inActiveIconColor,
                //   ),
                //   // onPressed: () => setState(() {
                //   //   selectedIndexHome = 1;
                //   // }),
                // ),
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
                // IconButton(
                //   icon: SvgPicture.asset(
                //     "assets/icons/Heart Icon.svg",
                //     color: selectedIndexHome == 3
                //         ? kPrimaryColor
                //         : inActiveIconColor,
                //   ),
                //   onPressed: () => setState(() {
                //     selectedIndexHome = 3;
                //   }),
                // ),
                // IconButton(
                //   icon: SvgPicture.asset(
                //     "assets/icons/User Icon.svg",
                //     color: selectedIndexHome == 4
                //         ? kPrimaryColor
                //         : inActiveIconColor,
                //   ),
                //   onPressed: () => setState(() {
                //     selectedIndexHome = 4;
                //   }),
                // ),
              ],
            ),
          if (!kIsWeb) SearchField(),
          if (!kIsWeb)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QRViewExample();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.PRIMARY_COLOR,
                  ),
                  child: Image.asset('assets/qr-code.png'),
                ),
              ),
            ),
          if (!kIsWeb)
            Container(
              width: 50,
              height: 50,
              child: Image.asset(
                "assets/logo.png",
              ),
            ),
          // IconBtnWithCounter(
          //     svgSrc: "assets/icons/Cart Icon.svg",
          //     press: () => Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (context) => CartScreen()))),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
