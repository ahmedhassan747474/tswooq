import 'package:flutter/material.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  @override
  Widget build(BuildContext context) {
   // final user = UserPreferences.myUser;

    return  Scaffold(
      //    appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfilePic(),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
             // Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
           //   NumbersWidget(),
              const SizedBox(height: 48),
           //   buildAbout(user),
            ],
          ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  // Widget buildUpgradeButton() => ButtonWidget(
  //   text: 'Upgrade To PRO',
  //   onClicked: () {},
  // );

  // Widget buildAbout(User user) => Container(
  //   padding: EdgeInsets.symmetric(horizontal: 48),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'About',
  //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 16),
  //       Text(
  //         user.about,
  //         style: TextStyle(fontSize: 16, height: 1.4),
  //       ),
  //     ],
  //   ),
  // );
}