import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';

class CoinCard {
  List<Widget> getCryptoCards(
    Map<String, String> cryptoPrices,
    String currencyType,
  ) {
    List<Widget> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        Padding(
          padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 $crypto = ${cryptoPrices[crypto] ?? '?'} $currencyType',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return cryptoCards;
  }
}
