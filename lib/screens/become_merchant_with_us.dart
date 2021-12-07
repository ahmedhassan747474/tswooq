import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/payment.dart';
import 'package:tswooq/models/vendor_be_come.dart';
import 'package:html/parser.dart' show parse;
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/screens/web.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_vendor.dart';

import '../constants.dart';

class BecomeMerchant extends StatefulWidget {
  @override
  _BecomeMerchantWidgetState createState() => _BecomeMerchantWidgetState();
}

class _BecomeMerchantWidgetState extends State<BecomeMerchant> {
  bool _isLoading = true;
  VendorBeCome beCome = new VendorBeCome();
  String mouth = '12';
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    beCome = await ApiVendor.instance.getVendorBouquet();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  Widget list(List<Widget> w) {
    return helpWidth(context) < 1000
        ? Column(
            children: w,
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: w,
          );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    print(helpWidth(context));
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          helpEn(context) ? 'Packages' : "الباقات",
          style: GoogleFonts.merriweather(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? helpLoading()
          : ListView(
              children: [
                list(List.generate(
                  beCome.data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: helpClip(
                      20,
                      Container(
                        color: Colors.black12.withOpacity(.06),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: helpClip(
                                  10,
                                  Container(
                                    color: Color(0xFF133444),
                                    // width: 400,
                                    child: Text(
                                      "${beCome.data[index].name}",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.visible,
                                      style: GoogleFonts.merriweather(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              helpCurrency("${beCome.data[index].price}",
                                  Colors.black, context,
                                  d: 18),
                              Container(
                                // width: helpWidth(context) < 500 ? 400 : 500,
                                child: Text(
                                  parse(
                                    "${beCome.data[index].description}",
                                  ).body.text.toString(),
                                  // removeAllHtmlTags(
                                  //   "${beCome.data[index].description}",
                                  // ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 53,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.0),
                                      color: const Color(0xfff0f3fd),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0x538b8b8b)),
                                    ),
                                    child: RadioListTile(
                                      contentPadding: EdgeInsets.zero,
                                      value: "12",
                                      groupValue: mouth,
                                      onChanged: (v) {
                                        if (mounted)
                                          setState(() {
                                            mouth = '12';
                                          });
                                      },
                                      title: Text(helpEn(context)
                                          ? '12 month'
                                          : "12 شهر"),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 53,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.0),
                                      color: const Color(0xfff0f3fd),
                                      border: Border.all(
                                          width: 1.0,
                                          color: const Color(0x538b8b8b)),
                                    ),
                                    child: RadioListTile(
                                      contentPadding: EdgeInsets.zero,
                                      value: "1",
                                      groupValue: mouth,
                                      onChanged: (v) {
                                        if (mounted)
                                          setState(() {
                                            mouth = '1';
                                          });
                                      },
                                      title: Text(
                                          helpEn(context) ? 'month' : "شهر"),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: kPrimaryColor,
                                  onPressed: () async {
                                    if (ApiProvider.user == null)
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()));
                                    else {
                                      _isLoading = true;
                                      setState(() {});

                                      Autogenerated a = await ApiVendor.instance
                                          .checkoutVendor({
                                        "package_id":
                                            "${beCome.data[index].id}",
                                        "price": "${beCome.data[index].price}",
                                        "month": "$mouth"
                                      });
                                      _isLoading = false;
                                      setState(() {});
                                      print(
                                          "------------------a.transaction.url--------------");
                                      print(a.transaction.url);
                                      kIsWeb
                                          ? helpLauncher(a.transaction.url)
                                          : Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          OrderView(a
                                                              .transaction
                                                              .url)),
                                            );
                                    }
                                  },
                                  child: Text(
                                    helpEn(context)
                                        ? "Book a package"
                                        : "حجز الباقة",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
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
