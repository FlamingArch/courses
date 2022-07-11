//TODO: Add your imports here.

import 'package:http/http.dart';

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
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const _apiKey = 'GeyApiKeyFromAccount';

class CoinData {
  final String currency;
  final String cryptocurrency;

  CoinData({
    this.currency = 'USD',
    this.cryptocurrency = 'BTC',
  });
  Future<String> getCoinData() async {
    var response =
        await get("$coinAPIURL/$cryptocurrency/$currency?apikey=$_apiKey");
    if (response.statusCode == 200) {
      return response.body;
    } else
      print("Error Getting Data. Response Code: " +
          response.statusCode.toString());
    return "Error";
  }
}
