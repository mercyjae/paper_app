import 'package:flutter/material.dart';
import 'package:wallpaper_hub/widgets/brand_name.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  const ImageView({Key? key, required this.imgUrl}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: BrandName(),centerTitle: true,
    ),body: Column(children: [
      Stack(children: [
        Hero(tag: widget.imgUrl,
          child: Container(width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network(widget.imgUrl,fit: BoxFit.cover,)),
        ),
        Container(width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
          Container(width:MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
            Color(0x36FFFFFF),
            Color(0x0FFFFFFF)
          ])),
              child: Column(
            children: [
              Text("Set wallpapers"),
              Text("Image will be saved in gallery")
            ],
          )),  SizedBox(height: 20,),
          Text("Cancel"),
              SizedBox(height: 50,),
        ],),),

      ],)

    ],),);
  }
}
