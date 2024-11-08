import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/utils/date_time_format.dart';
import 'package:bitcoin_ticker/widgets/appbar.dart';
import 'package:bitcoin_ticker/widgets/coin_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  PriceScreen({this.coinPrice});
  final coinPrice;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DateTimeFormat dateTimeFormat = DateTimeFormat();
  String dropdownValue = 'AUD';
  CoinData coinData = CoinData();
  String currencyType = 'AUD';
  Map<String, String> cryptoPrices = {};
  String updateTime = DateTime.now().toString();

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currencies in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currencies),
        value: currencies,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: dropdownValue,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            dropdownValue = value.toString();
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currencies in currenciesList) {
      pickerItems.add(Text(currencies));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) async {
        setState(() {
          currencyType = currenciesList[selectedIndex];
        });
        updatePrices();
      },
      children: pickerItems,
    );
  }

  @override
  void initState() {
    super.initState();

    updatePrices();
  }

  void updatePrices() async {
    Map<String, String> newPrices = {};
    late DateTime newTime;
    for (String crypto in cryptoList) {
      var coinPrice = await coinData.getCoinData(crypto, currencyType);
      if (coinPrice != null && coinPrice['rate'] != null) {
        newPrices[crypto] = coinPrice['rate'].toStringAsFixed(2);
        newTime = DateTime.parse(coinPrice['time']);
      } else {
        newPrices[crypto] = 'Error';
      }
    }
    setState(() {
      updateTime = dateTimeFormat.formatDate(newTime);
      cryptoPrices = newPrices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome().getAppBar(updateTime),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:
                      CoinCard().getCryptoCards(cryptoPrices, currencyType),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              // child: Platform.isIOS ? iOSPicker() : androidDropdown(),
              child: iOSPicker(),
            ),
          ),
        ],
      ),
    );
  }
}
