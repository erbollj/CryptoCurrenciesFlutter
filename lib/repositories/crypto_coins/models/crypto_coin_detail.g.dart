// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailAdapter extends TypeAdapter<CryptoCoinDetail> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetail(
      priceInUSD: fields[4] as double,
      imageURL: fields[5] as String,
      toSymbol: fields[0] as String,
      lastUpdate: fields[1] as DateTime,
      high24Hour: fields[2] as double,
      low24Hour: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetail obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.toSymbol)
      ..writeByte(1)
      ..write(obj.lastUpdate)
      ..writeByte(2)
      ..write(obj.high24Hour)
      ..writeByte(3)
      ..write(obj.low24Hour)
      ..writeByte(4)
      ..write(obj.priceInUSD)
      ..writeByte(5)
      ..write(obj.imageURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
