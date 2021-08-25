import 'package:flutter/material.dart';
import 'package:shop_app/helper/help.dart';
import 'package:shop_app/utils/api.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ApiProvider.user.data.avatar);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            // backgroundImage: AssetImage("assets/images/Profile Image.png"),
            child: helpImage(
                "https://tswooq.com" + ApiProvider.user.data.avatar, 50),
          ),
          // Positioned(
          //   right: -16,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 46,
          //     width: 46,
          //     child: FlatButton(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(50),
          //         side: BorderSide(color: Colors.white),
          //       ),
          //       color: Color(0xFFF5F6F9),
          //       onPressed: () {},
          //       child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
