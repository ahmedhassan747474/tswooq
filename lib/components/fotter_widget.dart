import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

class FooterWidget extends StatefulWidget {
  @override
  _FotterWidgetState createState() => _FotterWidgetState();
}

class _FotterWidgetState extends State<FooterWidget> {
  String _value;
  List<String> values = ["Arabic", "English"];
  Widget list(List<Widget> w) {
    return helpWidth(context) < 600
        ? Column(
            children: w,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: w,
          );
  }

  @override
  Widget build(BuildContext context) {
    print(helpWidth(context));
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        list([
          SizedBox(
              // aspectRatio: 1.02,
              width: helpWidth(context) * .1,
              child: Image.asset('assets/images/location.png')),
          Column(
            children: [
              SizedBox(
                // aspectRatio: 1.02,
                height: 50,
              ),
              Text(
                "موقعنــا",
                overflow: TextOverflow.visible,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                width: helpWidth(context) * .3,
                child: Text(
                  "الاحساء مكتـب ١٢ المملكة العربية السعودية",
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              // aspectRatio: 1.02,
              width: helpWidth(context) * .1,
              child: Image.asset('assets/images/sport.png')),
          Column(
            children: [
              SizedBox(
                // aspectRatio: 1.02,
                height: 50,
              ),
              Text(
                "خط الدعــم",
                overflow: TextOverflow.visible,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                "054212121210",
                overflow: TextOverflow.visible,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              // aspectRatio: 1.02,
              width: helpWidth(context) * .1,
              child: Image.asset('assets/images/@.png')),
          Column(
            children: [
              SizedBox(
                // aspectRatio: 1.02,
                height: 50,
              ),
              Text(
                "دعــم الطلـبات",
                overflow: TextOverflow.visible,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                "support@tswooq.com",
                overflow: TextOverflow.visible,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ]),
        Container(
          width: double.infinity,
          // height: height * 0.4,
          color: Color(0xff212a30),
          padding: EdgeInsets.only(top: 40, bottom: 40),
          child: list(
            [
              SizedBox(
                  // aspectRatio: 1.02,
                  width: helpWidth(context) * .16 < 100
                      ? 150
                      : helpWidth(context) * .17,
                  // height: 150,
                  child: Image.asset('assets/images/logofooter.png')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FotterItemWidget(
                    title:
                        helpEn(context) ? "Social Media" : "التواصل الاجتماعي",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: helpEn(context) ? "Instagram" : "الانستقرام",
                    onPressed: () =>
                        helpLauncher("https://www.instagram.com/tswooq.ksa/"),
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: helpEn(context) ? "Facebook" : "الفيس بوكس",
                    onPressed: () => helpLauncher(
                        "https://www.facebook.com/Tswooqcom-241188777825782"),
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: helpEn(context) ? "Twitter" : "تويتر",
                    onPressed: () => helpLauncher("https://twitter.com/tswooq"),
                  ),
                  // SizedBox(height: 10),
                  // FotterItemWidget(
                  //   title: "سناب شات",
                  //   onPressed: () {},
                  // ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FotterItemWidget(
                    title: helpEn(context) ? "SUPPORT" : "خـدمات العملاء",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "التواصل معنا",
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //     // aspectRatio: 1.02,
                  //     width: helpWidth(context) * .1 < 100
                  //         ? 100
                  //         : helpWidth(context) * .1,
                  //     // height: 150,
                  //     child: Image.asset('assets/images/logofooter.png')),
                  FotterItemWidget(
                    title: "Language",
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: LocaleKeys.language_translate.tr(),
                    onPressed: () async {
                      if (context.locale.toString() == 'ar') {
                        await context.setLocale(
                          Locale("en"),
                        );
                      } else {
                        await context.setLocale(
                          Locale("ar"),
                        );
                      }
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => helpLauncher(
                        "https://play.google.com/store/apps/details?id=com.tswooq.tswooq"),
                    child: SizedBox(
                      // aspectRatio: 1.02,
                      width: helpWidth(context) * .1 < 100
                          ? 100
                          : helpWidth(context) * .1,
                      // height: 150,
                      child: Image.asset(
                        'assets/images/google-play-btn.png',
                        // width: 200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => helpLauncher(
                        "https://apps.apple.com/us/app/tswooq/id1582862217#?platform=iphone"),
                    child: SizedBox(
                      width: helpWidth(context) * .1 < 100
                          ? 100
                          : helpWidth(context) * .1,
                      // height: 150,
                      // aspectRatio: 1.02,
                      child: Image.asset(
                        'assets/images/app-store-btn.png',
                        // width: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FotterItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  FotterItemWidget({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.merriweather(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          )),
    );
  }
}
