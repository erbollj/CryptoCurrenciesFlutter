
import 'package:flutter_projects/repositories/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetail(String currencyCode);
}