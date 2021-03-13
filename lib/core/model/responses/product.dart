import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  int year;
  String color;
  @JsonKey(name: 'pantone_name')
  String pantoneValue;

  Product({this.id, this.name, this.year, this.color, this.pantoneValue});

  static Product fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
