import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SnopZoom extends StatefulWidget {

  String _imagePath;
  SnopZoom(this._imagePath);
  @override
  State<SnopZoom> createState() => _SnopZoomState();
}

class _SnopZoomState extends State<SnopZoom> {


  @override
  Widget build(BuildContext context)=>Center(
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(borderRadius: BorderRadius.circular(20)
              ,child: CachedNetworkImage(imageUrl:widget._imagePath,fit: BoxFit.cover,),
            ),),),);
}



