import 'package:bitcoin_ticker/services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'XRP',
  'BCH',
  'ADA',
  'SOL',
  'DOT',
  'DOGE',
  'MATIC',
  'BNB',
];

const apiKey = 'Get your own api key for free on https://www.coinapi.io/';

class CoinData {
  Future<dynamic> getCoinData(String crypto, String currencyType) async {
    var url =
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currencyType?apikey=$apiKey';
    NetworkingHelper networkingHelper = NetworkingHelper(url);

    var coinData = await networkingHelper.getData();
    return coinData;
  }
}
