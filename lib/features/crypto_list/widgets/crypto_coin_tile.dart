import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text("${coinDetails.priceInUSD}\$", style: theme.textTheme.labelSmall),
      onTap: () {
        Navigator.of(context).pushNamed("/coin", arguments: coin);
      },
    );
  }
}
