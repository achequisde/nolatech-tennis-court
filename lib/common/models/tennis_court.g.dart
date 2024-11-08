// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tennis_court.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TennisCourtImpl _$$TennisCourtImplFromJson(Map<String, dynamic> json) =>
    _$TennisCourtImpl(
      title: json['title'] as String,
      type: json['type'] as String,
      price: (json['price'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$TennisCourtImplToJson(_$TennisCourtImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'price': instance.price,
      'address': instance.address,
    };
