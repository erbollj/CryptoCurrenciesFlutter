import 'package:flutter_projects/features/crypto_coin/crypto_coin.dart';
import 'package:flutter_projects/features/crypto_list/crypto_list.dart';

final routes = {
  "/": (context) => const CryptoListScreen(),
  "/coin": (context) => const CryptoCoinScreen(),
};