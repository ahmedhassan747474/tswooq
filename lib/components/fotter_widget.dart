import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatefulWidget {
  @override
  _FotterWidgetState createState() => _FotterWidgetState();
}

class _FotterWidgetState extends State<FooterWidget> {
  String _value;
  List<String> values = ["Arabic", "English"];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.5,
      color: Color(0xff212a30),
      padding: EdgeInsets.only(top: 40, bottom: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FotterItemWidget(
                title: "Company",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Contact Us",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Become A Partner",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Blog",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Rewards",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Work with Us",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Meet the Team",
                onPressed: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FotterItemWidget(
                title: "SUPPORT",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Account",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "About Us",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Legal",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Contact",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Affiliate Program",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Privacy Policy",
                onPressed: () {},
              ),
              SizedBox(height: 10),
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
              FotterItemWidget(
                title: "California",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Ohio",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              FotterItemWidget(
                title: "Alaska",
                onPressed: () {},
              ),
              SizedBox(height: 10),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                      .toList(),
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .headline1
                  //     .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
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
