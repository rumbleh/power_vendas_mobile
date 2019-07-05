import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {

  int get id => 1;

  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  static const ABC = ["A","B","C","D","E","F","G","H","I","J",
    "K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
  final List<ListItem> items = List<ListItem>.generate(
  26,
  (i) => i % 3 == 0
  ? HeadingItem(ABC[i == 0 ? 0 : i - 2])
      : MessageItem("Cliente Exemplo $i", "CNPJ 17.359.233/0001-0$i"),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        }
      },
    );
//    return Center(
//      child: Container(
//        height: 200,
//        width: 200,
//        alignment: Alignment(0, 0),
//        child: Text(
//          "Clientes",
//          style: TextStyle(fontSize: 40, color: Colors.white),
//        ),
//        color: Colors.indigo,
//      ),
//    );
  }
}

// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}