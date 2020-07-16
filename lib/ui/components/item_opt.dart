import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';

class ItemOpt extends StatelessWidget {
  final Image _image;
  final String _nameOpt;

  ItemOpt(this._image, this._nameOpt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
          color: ColorHelper.bgItemColor,
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_image, Center(child: Text('$_nameOpt'))],
      ),
    );
  }
}
