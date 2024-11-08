import 'package:flutter/material.dart';

class AppBarHome {
  PreferredSizeWidget getAppBar(updateTime) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.lightBlueAccent,
      elevation: 5,
      shadowColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '🤑 Coin Ticker',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Last Updated:\n$updateTime',
                style: TextStyle(color: Colors.white, fontSize: 16),
                overflow:
                    TextOverflow.ellipsis, // Adds ellipsis if text overflows
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
