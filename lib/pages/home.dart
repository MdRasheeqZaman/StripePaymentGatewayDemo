import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context, index){
              Icon icon = Icon((index == 0) ? Icons.add_rounded : Icons.credit_card, color: themeData.primaryColor,);
              Text text = Text((index == 0) ? 'Pay via New Card' : 'Pay via Existing Card');
              return InkWell(
                onTap: () => onItemPress(context, index),
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: themeData.primaryColor,
            ),
            itemCount: 2
        ),
      ),
    );
  }

  onItemPress(BuildContext context, int index) {
    print('Index: ${index.toString()}');
  }
}
