import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tswooq/helper/help.dart';

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
                    title: "مواقع التواصل",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "الانستقرام",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "الفيس بوكس",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "تويتر",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "سناب شات",
                    onPressed: () {},
                  ),
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
                  FotterItemWidget(
                    title: "TOP CITIES",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "Chicago",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "New York",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  FotterItemWidget(
                    title: "San Francisco",
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      // aspectRatio: 1.02,
                      width: helpWidth(context) * .1 < 100
                          ? 100
                          : helpWidth(context) * .1,
                      // height: 150,
                      child: Image.asset('assets/images/logofooter.png')),
                  FotterItemWidget(
                    title: "Language",
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField<String>(
                      value: _value,
                      onChanged: (v) {
                        setState(() {
                          _value = v;
                        });
                      },
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      items: values
                          ?.map(
                            (String element) => DropdownMenuItem<String>(
                              value: element,
                              child: Text(
                                element,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          ?.toList(),
                      selectedItemBuilder: (context) => values
                          .map(
                            (element) => Text(
                              element,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                          .toList(),
                      decoration: InputDecoration(
                        hintText: 'Choose Language',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
