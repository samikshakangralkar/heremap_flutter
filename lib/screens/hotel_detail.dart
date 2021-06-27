import 'package:flutter/material.dart';
import 'package:here_app/models/map_data_model.dart';

class HotelDetail extends StatelessWidget {
  final Items items;
  const HotelDetail({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
      ),
      body: Column(
        children: [
          Text(items.title.toString()),
          Text("Distance: ${items.distance}"),
          Text("Category: ${items.category.title}"),
          Text("Vicinity: ${items.vicinity}"),
          Text("openingHours: ${items.openingHours.text}"),
          Text("Is Open: ${items.openingHours.isOpen ? 'Yes' : 'No'}"),



        ],
      ),
    );
  }
}
