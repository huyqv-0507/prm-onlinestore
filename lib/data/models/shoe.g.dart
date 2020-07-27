// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shoe _$ShoeFromJson(Map<String, dynamic> json) {
  return Shoe(
    json['shoeId'] as int,
    json['shoeName'] as String,
    json['title'] as String,
    json['color'] as String,
    json['size'] as String,
    (json['price'] as num).toDouble(),
    json['description'] as String,
    json['brandId'] as int,
  );
}

Map<String, dynamic> _$ShoeToJson(Shoe instance) => <String, dynamic>{
      'shoeId': instance.shoeId,
      'shoeName': instance.shoeName,
      'title': instance.title,
      'color': instance.color,
      'size': instance.size,
      'price': instance.price,
      'description': instance.description,
      'brandId': instance.brandId,
    };
