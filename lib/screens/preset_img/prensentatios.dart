import 'package:flutter/material.dart';

class PresetantionImg extends StatefulWidget {
  PresetantionImg({Key? key}) : super(key: key);

  @override
  State<PresetantionImg> createState() => _PresetantionImgState();
}

class _PresetantionImgState extends State<PresetantionImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "merda",
          child: Container(
            width: 300.00,
            height: 600.00,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: ExactAssetImage('assets/images/hidrosmall.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
