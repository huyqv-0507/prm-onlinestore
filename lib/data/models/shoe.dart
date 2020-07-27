import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'shoe.g.dart';

@JsonSerializable(nullable: false)
class Shoe {
  final int shoeId;
  final String shoeName;
  final String title;
  final String color;
  final String size;
  final double price;
  final String description;
  final int brandId;

  Shoe(this.shoeId, this.shoeName, this.title, this.color, this.size,
      this.price, this.description, this.brandId);

  factory Shoe.fromJson(Map<String, dynamic> json) => _$ShoeFromJson(json);

  Map<String, dynamic> toJson() => _$ShoeToJson(this);
}
