import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tokenapp/utils/dimens.dart';

class ProfilePictureWidget extends StatelessWidget {

  final String imgUrl;

  const ProfilePictureWidget({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(dp200)),
      child:  CachedNetworkImage(
        height: dp50,
        width: dp50,
        imageUrl: imgUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
