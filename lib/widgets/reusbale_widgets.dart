import 'package:flutter/material.dart';

enum widgetType { bed, oxygen, blood }

class InfoContainer extends StatelessWidget {
  final String title;
  final String address;
  final String contactNumber;
  final String numOfBeds;
  final String location;
  final double iconSize = 40.0;
  final String description;
  final widgetType typeWidget;

  InfoContainer(
      {@required this.title,
      @required this.address,
      @required this.contactNumber,
      @required this.numOfBeds,
      @required this.location,
      @required this.description,
      @required this.typeWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.location_city,
                  size: iconSize,
                ),
                Flexible(
                  child: Text(
                    location,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.location_history,
                  size: iconSize,
                ),
                Flexible(
                  child: Text(
                    address,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.phone_android,
                  size: iconSize,
                ),
                Flexible(
                  child: Text(
                    contactNumber,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.king_bed,
                  size: iconSize,
                ),
                Flexible(
                  child: Text(
                    numOfBeds,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  size: iconSize,
                ),
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
