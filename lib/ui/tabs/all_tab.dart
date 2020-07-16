import 'package:flutter/material.dart';
import 'package:online_store/helpers/colors/color_helper.dart';
import 'package:online_store/models/shoe.dart';
import 'package:online_store/ui/components/item_card.dart';
import 'package:online_store/ui/components/item_card_toptrending.dart';
import 'package:online_store/ui/components/item_opt.dart';
import 'package:online_store/ui/screens/detail_screen.dart';

class AllTab extends StatefulWidget {
  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  List<Shoe> shoes = getShoes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 291,
                  decoration: BoxDecoration(color: ColorHelper.bgColor),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ColorHelper.bgItemColor,
                          ),
                          child: Image.asset(
                            'assets/images/advertising.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      child: Wrap(
                        runSpacing: 18,
                        spacing: 31.5,
                        children: [
                          ItemOpt(
                              Image.asset('assets/icons/shoe.png'), 'Brands'),
                          ItemOpt(Image.asset('assets/icons/news.png'), 'News'),
                          ItemOpt(
                              Image.asset('assets/icons/free.png'), 'Freeship'),
                          ItemOpt(
                              Image.asset('assets/icons/coupon.png'), 'Coupon'),
                          ItemOpt(Image.asset('assets/icons/calendar.png'),
                              'Event'),
                          ItemOpt(
                              Image.asset('assets/icons/order.png'), 'Order'),
                          ItemOpt(
                              Image.asset('assets/icons/new.png'), 'Arrivals'),
                          ItemOpt(Image.asset('assets/icons/more.png'), 'More'),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best sales',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.navigate_next), onPressed: null)
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      shoe: shoes[index],
                                    ))),
                        child: ItemCard(shoes[index]));
                  },
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top trending',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.navigate_next), onPressed: null)
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: shoes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    shoe: shoes[index],
                                  ))),
                      child: ItemCardTopTrending(shoes[index]));
                }),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
