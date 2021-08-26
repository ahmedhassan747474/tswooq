import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/components/loading_screen.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/screens/search_result/search_result_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/api_products.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatefulWidget {
  SearchField({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchFieldState();
  }
}

class SearchFieldState extends State<SearchField> {
  SearchProduct products = new SearchProduct(productData: []);
  final _formKey = GlobalKey<FormState>();
  String search;

  Future<void> _submit() async {
    _formKey.currentState.validate();
    try {
      print('0000000000000000000000000000');
      if (_formKey.currentState.validate()) {
        print('111111111111111111111');
        _formKey.currentState.save();
        LoadingScreen.show(context);
        products = await ApiProducts.instance.search(search);
        Navigator.of(context).pop();

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SearchResult(products: products)));
      }
    } on ApiException catch (_) {
      print('ApiException');
      Navigator.of(context).pop();
      ServerConstants.showDialog1(context, _.toString());
    } on DioError catch (e) {
      //<<<<< IN THIS LINE
      print(
          "e.response.statusCode    ////////////////////////////         DioError");
      if (e.response.statusCode == 400) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        // print(e.request);
      }
    } catch (e) {
      print('catch');
      print(e);

      Navigator.of(context).pop();
      ServerConstants.showDialog1(context, e.toString());
    } finally {
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          onSaved: (newValue) => search = newValue,
          onChanged: (value) => print(value),
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (_) {
            _submit();
            // Navigator.of(context).pushReplacement(
            //         MaterialPageRoute(builder: (context) => ));
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: (LocaleKeys.Search_Product_translate.tr()),
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
