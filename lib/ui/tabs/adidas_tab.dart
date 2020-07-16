import 'package:flutter/material.dart';
import 'package:online_store/ui/components/item_card_toptrending.dart';

class AdidasTab extends StatefulWidget {
  @override
  _AdidasTabState createState() => _AdidasTabState();
}

class _AdidasTabState extends State<AdidasTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: GridView.count(
              shrinkWrap: true, crossAxisCount: 2, children: [])),
    );
  }
}
