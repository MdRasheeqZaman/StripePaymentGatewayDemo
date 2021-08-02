import 'package:flutter/material.dart';

class ExistingCardsPage extends StatefulWidget {
  const ExistingCardsPage({Key? key}) : super(key: key);

  @override
  ExistingCardsPageState createState() => ExistingCardsPageState();
}

class ExistingCardsPageState extends State<ExistingCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a card'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Text('Existing Card'),
      ),
    );
  }
}