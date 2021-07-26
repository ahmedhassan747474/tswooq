import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';

import 'package:shop_app/models/products.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ColorDotsState();
  }
}
class ColorDotsState extends State<ColorDots>{
  int counter =1;
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          // ...List.generate(
          // //  product.colors.length,
          //   (index) => ColorDot(
          //     color: product.colors[index],
          //     isSelected: index == selectedColor,
          //   ),
          // ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if(counter>1)
                counter--;
              });
            },
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
          Text(counter.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(width: getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () { setState(() {
              counter++;
            });},
          ),
        ],
      ),
    );
  }



// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key key,
//     @required this.color,
//     this.isSelected = false,
//   }) : super(key: key);
//
//   final Color color;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 2),
//       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//       height: getProportionateScreenWidth(40),
//       width: getProportionateScreenWidth(40),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//             Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
 }
