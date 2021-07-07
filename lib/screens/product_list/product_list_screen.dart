import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: 'yy',
                  child: Image.network(
                    '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "title",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(
                  color: Colors.black54,
                ),
              ),
            ),
            Center(
              child: Text(
                "\$ 444",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(
                  color: Colors.black54,
                ),
              ),
            ),
    ]
    )
      ]
    ),
    );
  }
}
