import 'package:json_annotation/json_annotation.dart';
import 'package:wiredbrain/helpers/helpers.dart';
import 'package:wiredbrain/models/additions.dart';
import 'package:wiredbrain/models/coffee.dart';
import 'package:wiredbrain/models/cup_size.dart';
import 'package:wiredbrain/models/sugar_cube.dart';

part 'cart_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItem {
  CartItem({
    this.id,
    required this.coffee,
    required this.size,
    required this.count,
    required this.sugar,
    required this.additions,
  });

  num get total => getCartItemsTotal(
        count: count,
        price: coffee.price,
        additions: additions.length,
        size: size.index,
        sugar: sugar.index,
      );

  final String? id;

  final Coffee coffee;

  final CoffeeCupSize size;
  final CoffeeSugarCube sugar;
  final int count;
  final List<CoffeeAddition> additions;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
