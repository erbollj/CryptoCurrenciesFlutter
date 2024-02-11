import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detail.g.dart';

@JsonSerializable()
class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail(
      {required this.priceInUSD,
      required this.imageURL,
      required this.toSymbol,
      required this.lastUpdate,
      required this.high24Hour,
      required this.low24Hour});

  @JsonKey(name: "TOSYMBOL")
  final String toSymbol;

  @JsonKey(
      name: "LASTUPDATE", toJson: _dateTimeToJSON, fromJson: _dateTimeFromJSON)
  final DateTime lastUpdate;

  @JsonKey(name: "HIGH24HOUR")
  final double high24Hour;

  @JsonKey(name: "LOW24HOUR")
  final double low24Hour;

  @JsonKey(name: "PRICE")
  final double priceInUSD;

  @JsonKey(name: "IMAGEURL")
  final String imageURL;

  String get fullImageUrl => "https://www.cryptocompare.com/$imageURL";

  factory CryptoCoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailToJson(this);

  static int _dateTimeToJSON(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJSON(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object?> get props =>
      [toSymbol, lastUpdate, high24Hour, low24Hour, priceInUSD, imageURL];
}
