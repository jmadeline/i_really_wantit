import 'package:flutter/material.dart';
import 'package:i_really_wantit/models/utils/buttonMenu.dart';
import 'package:i_really_wantit/models/utils/iconCategory.dart';
import 'package:i_really_wantit/models/utils/createGiftList.dart';
import 'package:i_really_wantit/shared/giftList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'Noël';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('I Really Want It'),
          toolbarHeight: 100,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xff86CECB), Color(0xff9684BE)]),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ButtonMenu(
          onPress: () => createGiftList(
            context,
            formKey,
            dropdownValue,
          ),
        ),
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
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 0, 10),
                  child: Text(
                    'Catégories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconCategory(
                      colorIcon: Colors.blue[100],
                      iconDesign: Icons.ac_unit,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Noël'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconCategory(
                      iconDesign: Icons.cake,
                      colorIcon: Colors.deepOrange[400],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Anniversaire'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconCategory(
                      colorIcon: Colors.red,
                      iconDesign: Icons.favorite,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Saint Valentin'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(
              color: Colors.grey[400],
              height: 5.0,
              indent: 15.0,
              endIndent: 15.0,
            ),
            SizedBox(height: 20),
            Flexible(
              child: GiftList(),
            ),
          ],
        ),
      ),
    );
  }
}
