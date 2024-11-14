import 'dart:convert';
import 'package:get/get.dart';

class ProductModel {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final double price;
  RxInt quantity;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    int quantity = 1,
  }) : quantity = quantity.obs; // Initialize quantity as an RxInt

  ProductModel copyWith({
    int? id,
    String? image,
    String? title,
    String? subtitle,
    String? description,
    double? price,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity.value, // Access RxInt with .value
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'price': price,
      'quantity': quantity.value, // Access RxInt with .value
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 0,
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, image: $image, title: $title, subtitle: $subtitle, description: $description, price: $price, quantity: ${quantity.value})'; // Access RxInt with .value
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.image == image &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description &&
        other.price == price &&
        other.quantity.value == quantity.value; // Access RxInt with .value
  }

  @override
  int get hashCode {
    return id.hashCode ^
    image.hashCode ^
    title.hashCode ^
    subtitle.hashCode ^
    description.hashCode ^
    price.hashCode ^
    quantity.value.hashCode; // Access RxInt with .value
  }
}
