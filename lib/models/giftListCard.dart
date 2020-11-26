import 'package:i_really_wantit/models/gift.dart';

class GiftListCard {
  final String name;
  final int itemsNumber;
  final String listCreator;
  final String category;
  final String image;
  final String eventDate;
  final List<Gift> gift;

  GiftListCard(
      {this.name,
      this.itemsNumber,
      this.listCreator,
      this.category,
      this.image,
      this.eventDate,
      this.gift});
}
