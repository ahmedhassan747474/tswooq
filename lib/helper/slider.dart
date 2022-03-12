import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/models/slider_model.dart';
import 'package:tswooq/utils/api_home.dart';
import 'package:tswooq/utils/vars.dart';

import 'loading_shimmer.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  bool _isLoading = true;
  SlidersModel slider = new SlidersModel();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    slider = await ApiHome.instance.getSlider();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return imageSlider(slider.data, _isLoading, width);
  }
}

Widget imageSlider(List<Sliders> sliders, bool loading, double width) {
  return Container(
    height: kIsWeb ? 450 : 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loading
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: loadingShimmerWidget(width, kIsWeb ? 400 : 166, 16))
            : CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  height: kIsWeb ? 400 : 200,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    // print("${ServerConstants.DOMAIN}${sliders[index].path}");
                  },
                ),
                items: List.generate(
                  sliders.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    height: 166,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ServerConstants.DOMAIN}${sliders[index].path}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                          width: 80,
                          height: kIsWeb ? 400 : 80,
                          child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Container(
                          height: kIsWeb ? 400 : 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(.9),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image.asset('assets/logo.png'),
                          )),
                    ),
                  ),
                )),
      ],
    ),
  );
}
