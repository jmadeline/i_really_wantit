import 'package:flutter/material.dart';
import 'package:i_really_wantit/models/giftListCard.dart';
import 'package:i_really_wantit/screens/detailsList.dart';

class GiftList extends StatefulWidget {
  @override
  _GiftListState createState() => _GiftListState();
}

class _GiftListState extends State<GiftList> {
  List<Widget> _giftListTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _addGiftList();
  }

  void _addGiftList() {
    List<GiftListCard> _giftListsCards = [
      GiftListCard(
          name: 'Maman liste de Noël',
          itemsNumber: 10,
          listCreator: 'Maman',
          category: 'Noël',
          image: 'christmas.jpg',
          eventDate: '25 décembre'),
      GiftListCard(
          name: 'Anniversaire Papa',
          itemsNumber: 8,
          listCreator: 'Papa',
          category: 'Anniversaire',
          image: 'christmas.jpg',
          eventDate: '18 décembre'),
      GiftListCard(
          name: 'Cromignon Saint Val',
          itemsNumber: 5,
          listCreator: 'Cromignon',
          category: 'Saint Valentin',
          image: 'christmas.jpg',
          eventDate: '14 février'),
    ];

    _giftListsCards.forEach((GiftListCard giftListCard) {
      return _giftListTiles.add(_buildTile(giftListCard));
    });
  }

  Widget _buildTile(GiftListCard giftListCard) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsList(giftListCard: giftListCard),
          ),
        );
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            '${giftListCard.name}',
            style: TextStyle(
              color: Colors.grey[800],
              wordSpacing: 3,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text('${giftListCard.itemsNumber} articles',
              style: TextStyle(color: Color(0xffF2786B), fontSize: 13)),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              text: 'créé par ',
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
              children: <InlineSpan>[
                TextSpan(
                  text: '${giftListCard.listCreator}',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Hero(
          tag: 'location-image${giftListCard.image}-${giftListCard.name}',
          child: Image.asset(
            'images/${giftListCard.image}',
            height: 100,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _giftListTiles.length,
        itemBuilder: (context, index) {
          return _giftListTiles[index];
        });
  }
}
