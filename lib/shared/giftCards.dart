import 'package:flutter/material.dart';
import 'package:i_really_wantit/models/gift.dart';
import 'package:url_launcher/url_launcher.dart';

class GiftCards extends StatefulWidget {
  @override
  _GiftCardsState createState() => _GiftCardsState();
}

class _GiftCardsState extends State<GiftCards> {
  List<Widget> _giftTiles = [];

  @override
  void initState() {
    super.initState();

    _addGiftCard();
  }

  void _addGiftCard() {
    List<Gift> _giftCards = [
      Gift(
        name: 'Cadeau 1 yyyyyyyyyyyyyyyibikjolkpmlljhbgvhbjnk,lmhhh',
        price: 20,
        link: 'https://www.google.com',
        img: 'christmas.jpg',
      ),
      Gift(
        name: 'Cadeau 2',
        price: 20,
        link: 'https://www.google.com',
        img: 'christmas.jpg',
      ),
      Gift(
        name: 'Cadeau 3',
        price: 20,
        link: 'https://www.google.com',
        img: 'christmas.jpg',
      ),
    ];

    _giftCards.forEach((Gift gift) {
      return _giftTiles.add(_buildCard(gift));
    });
  }

  Widget _buildCard(Gift gift) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'images/${gift.img}',
                  fit: BoxFit.fitWidth,
                  height: 90,
                ),
              ),
            ],
          ),
          ListTile(
            onTap: () async {
              if (await canLaunch(gift.link)) {
                await launch(gift.link);
              } else {
                throw 'Could not launch ${gift.link}';
              }
            },
            title: Text(
              '${gift.name}',
              style: TextStyle(
                color: Colors.grey[800],
                wordSpacing: 3,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${gift.price} €',
                style: TextStyle(color: Color(0xffF2786B), fontSize: 16)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _giftTiles[index];
            },
            childCount: _giftTiles.length,
          ),
        ),
      ],
    );
  }
}
