import 'package:dio/dio.dart';
import 'package:flutter_projects/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepo implements AbstractCoinsRepo {
  CryptoCoinsRepo({required this.dio, required this.cryptoCoinsBox});

  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinsListFromAPI();
      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }
    cryptoCoinsList
        .sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromAPI() async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,BRD,COL,CAG,DOV&tsyms=USD");
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final details = CryptoCoinDetail.fromJson(usdData);
      return CryptoCoin(name: e.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetail(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromAPI(currencyCode);
      cryptoCoinsBox.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromAPI(String currencyCode) async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD");
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data["RAW"] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData["USD"] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);

    return CryptoCoin(name: currencyCode, details: details);
  }
}
