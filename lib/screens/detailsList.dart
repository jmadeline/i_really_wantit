import 'package:flutter/material.dart';
import 'package:i_really_wantit/models/gift.dart';
import 'package:i_really_wantit/models/giftListCard.dart';
import 'package:i_really_wantit/models/utils/buttonMenu.dart';
import 'package:i_really_wantit/shared/giftCards.dart';

class DetailsList extends StatelessWidget {
  final GiftListCard giftListCard;
  final Gift gift;
  DetailsList({this.giftListCard, this.gift});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonMenu(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              color: Colors.grey[400],
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.grey[400],
              icon: Icon(Icons.exit_to_app),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                    child: Hero(
                      tag:
                          'location-image-${giftListCard.image}-${giftListCard.name}',
                      child: Image.asset(
                        'images/${giftListCard.image}',
                        height: 200,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 150,
                right: 50,
                left: 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[350],
                        blurRadius: 4,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        giftListCard.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          '${giftListCard.itemsNumber} articles',
                          style: TextStyle(
                            color: Color(0xffF2786B),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                            'Date de l\'évènement : ${giftListCard.eventDate}'),
                        SizedBox(height: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 80),
          Expanded(child: GiftCards()),
        ],
      ),
    );
  }
}
