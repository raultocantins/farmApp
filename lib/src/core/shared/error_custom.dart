import 'package:flutter/material.dart';

errorCustom(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: SizedBox(
      height: 80,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Icon(
              Icons.error,
              color: Colors.white,
            ),
          ),
          Text(text),
        ],
      ),
    )),
  );
}
