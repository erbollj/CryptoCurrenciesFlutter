// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetail _$CryptoCoinDetailFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetail(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageURL: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetail._dateTimeFromJSON(json['LASTUPDATE'] as int),
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hour: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailToJson(CryptoCoinDetail instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'LASTUPDATE': CryptoCoinDetail._dateTimeToJSON(instance.lastUpdate),
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hour,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageURL,
    };
