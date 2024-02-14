import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/features/crypto_coin/crypto_coin.dart';
import 'package:flutter_projects/features/crypto_list/crypto_list.dart';
import 'package:flutter_projects/repositories/crypto_coins/crypto_coins.dart';

// final routes = {
//   "/": (context) => const CryptoListScreen(),
//   "/coin": (context) => const CryptoCoinScreen(),
// };

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CryptoListRoute.page, path: "/"),
    AutoRoute(page: CryptoCoinRoute.page),

  ];

}