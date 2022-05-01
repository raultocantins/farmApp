import 'package:flutter/material.dart';

class HomeButtonCustom extends StatelessWidget {
  const HomeButtonCustom(
      {Key? key,
      required this.topRight,
      required this.bottomLeft,
      required this.topLeft,
      required this.bottomRight,
      required this.assetImage,
      required this.title,
      required this.fn})
      : super(key: key);

  final double topRight;
  final double bottomLeft;
  final double topLeft;
  final double bottomRight;
  final AssetImage assetImage;
  final String title;
  final Function fn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight)),
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        fn();
      },
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(2, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
              topLeft: Radius.circular(topLeft),
            ),
          ),
          width: 140,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(3),
                  width: 60,
                  height: 60,
                  child: Image.asset(assetImage.assetName)),
              const SizedBox(
                height: 10,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
