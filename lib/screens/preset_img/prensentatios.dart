import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PresetantionImg extends StatefulWidget {
  PresetantionImg({Key? key , required this.assetsImg , required this.refTag}) : super(key: key);
  String refTag , assetsImg  ;


  @override
  State<PresetantionImg> createState() => _PresetantionImgState();
}

class _PresetantionImgState extends State<PresetantionImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
              Hero(
                tag: widget.refTag,
                child: Container(
                  width: 300.00,
                  height: 600.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage(widget.assetsImg),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container( width: 300,
                height: 600,
                decoration: BoxDecoration(border: Border.all(color: Colors.white),),),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
