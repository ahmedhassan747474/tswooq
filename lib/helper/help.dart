import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tswooq/utils/vars.dart';
import 'package:url_launcher/url_launcher.dart';

import 'loading_screen.dart';

const maleColor = Color(0xFF6C25CA);
const femaleColor = Color(0xFFF857A6);

Color helpColor() {
  return femaleColor;
}

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void helpNavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

int i = 0;
int helpHero() {
  return i++;
}

bool helpMobile(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide < 600;
}

double helpWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double helpHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String helpLanguage = 'ar';
// Locale helpLocale = Locale('en');
helpEn(BuildContext context) {
  if (context.locale.toString() == 'ar') {
    helpLanguage = 'ar';
  } else {
    helpLanguage = 'en';
  }
  return context.locale.toString() == 'en';
}

class LoadingClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: LoadingWidget(color: Colors.red),
    );
  }
}

void helpShowLongToast(String s) {
  Fluttertoast.showToast(
    msg: "$s",
    toastLength: Toast.LENGTH_LONG,
  );
}

helpCurrency(String s, Color c, BuildContext context) {
  String currency;
  if (context.locale.toString() == 'ar')
    currency = "رس";
  else
    currency = "SAR";
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: '${double.parse(s).toStringAsFixed(2) ?? ''}',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: c),
        ),
        TextSpan(
          text: '$currency',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: c),
        ),
      ],
    ),
  );
}

Widget helpLoading() {
  return Container(
    margin: EdgeInsets.only(top: 4.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingWidget(color: Colors.red),
        SizedBox(
          height: 50,
          width: 100,
          child: LoadingIndicator(
            indicatorType: Indicator.ballBeat,
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
      ],
    ),
  );
}

Future<void> helpLauncher(String url) async {
  print(url);
  if (await canLaunch(url)) {
    await launch(
      url,
      // forceSafariVC: false,
      // forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

Widget helpImage(String image, double radius) {
  return CachedNetworkImage(
    imageUrl: image,
    // imageUrl: "$image",
    fit: BoxFit.contain,
    imageBuilder: (ctx, image) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: image,
            fit: BoxFit.contain,
          ),
        ),
      );
    },
    placeholder: (_, __) => LoadingWidget(),
    errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(.9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset('assets/logo.png'),
        )),
  );
}

Widget helpClip(double radius, Widget widget) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: widget,
  );
}

Widget helpRowAttributes(
    double width, String urlImage, String string, double radius) {
  return Row(
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Card(
        child: FractionalTranslation(
          translation: Offset(0, 0),
          child: Container(
            width: 40,
            height: 40,
            child: helpImage(urlImage, radius),
          ),
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Container(
        width: width,
        child: Text(
          '$string',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: AppColors.PRIMARY_COLOR),
        ),
      ),
    ],
  );
}

Widget backgroundImage(double width) {
  return Container(
    height: 300.0,
    width: width,
    child: Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Positioned(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/properse.png",
              fit: BoxFit.fill,
            ),
          ),
          top: -50,
        ),
      ],
    ),
  );
}

// Widget cartControle(Function f) {
//   return InkWell(
//     onTap: f,
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       margin: EdgeInsets.symmetric(
//         horizontal: 8,
//         vertical: 4,
//       ),
//       child: Stack(
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: new BorderRadius.all(
//                   Radius.circular(15),
//                 ),
//                 child: Container(
//                   // padding: EdgeInsets.symmetric(horizontal: 20),
//
//                   // image is square but we add extra 20 + 20 padding thats why width is 200
//                   width: 133,
//                   child: Image.network(
//                     'https://media-cdn.tripadvisor.com/media/photo-s/0b/65/b6/50/hotel-imaage.jpg',
//                     fit: BoxFit.cover,
//                     height: 120,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     ' Homestay Hotel',
//                     style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.w700, fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Text(
//                     'Lake Mary, Florida',
//                     style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.w500, fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
// //                   RatingBar.builder(
// //                     initialRating: double.parse('4'),
// //                     minRating: 1,
// //                     direction: Axis.horizontal,
// //                     allowHalfRating: true,
// //                     itemCount: 5,
// //                     itemSize: 16,
// // //                    glowColor:
// //                     unratedColor: Color(0xFF464E63),
// //                     //  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
// //                     itemBuilder: (context, _) => Icon(
// //                       Icons.star,
// //                       //  size: 12,
// //                       color: Color(0xFFFFB900),
// //                     ),
// // //                        onRatingUpdate: (rating) {
// // //                          print(rating);
// // //                        },
// //                   ),
//                 ],
//               ),
//               Spacer(),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget cartControleMoreItem(Function f, Property popular) {
//   return InkWell(
//     onTap: f,
//     child: Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       margin: EdgeInsets.symmetric(
//         horizontal: 8,
//         vertical: 4,
//       ),
//       child: Stack(
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               ClipRRect(
//                 borderRadius: new BorderRadius.all(
//                   Radius.circular(15),
//                 ),
//                 child: Container(
//                   width: 133,
//                   height: 133,
//                   child: imageWidget(popular.image, BoxFit.fill),
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '${popular.name}',
//                     style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.w700, fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Text(
//                     '${popular.cityName} ${popular.countryName}',
//                     style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.w500, fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   RatingBar.builder(
//                     initialRating: double.parse(popular.rates.rateCount),
//                     minRating: 1,
//                     direction: Axis.horizontal,
//                     allowHalfRating: true,
//                     itemCount: 5,
//                     itemSize: 16,
// //                    glowColor:
//                     unratedColor: Color(0xFF464E63),
//                     //  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                     itemBuilder: (context, _) => Icon(
//                       Icons.star,
//                       //  size: 12,
//                       color: Color(0xFFFFB900),
//                     ),
//                   ),
//                 ],
//               ),
//               Spacer(),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }
