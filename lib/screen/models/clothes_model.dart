import 'package:flutter/material.dart';

class ClothesModel {
  String? name;
  String? description;
  String? price;
  String? image;
  Color? bgColor;

  ClothesModel({
    this.name,
    this.description,
    this.price,
    this.image,
    this.bgColor,
  });
}

List<ClothesModel> clotheList = [
  ClothesModel(
    description: "best quality saree",
    image: "assets/images/saree.png",
    name: "High quality silk Saree",
    price: "3,490.00",
    bgColor: const Color(0xFF366873),
  ),
  ClothesModel(
    description: "best quality saree",
    image: "assets/images/saree.png",
    name: "High quality silk Saree",
    price: "3,490.00",
    bgColor: const Color(0xFF3f2147),
  ),
  ClothesModel(
    description: "best quality saree",
    image: "assets/images/saree.png",
    name: "High quality silk Saree",
    price: "3,490.00",
    bgColor: const Color(0xFF1f3a4d),
  ),
  ClothesModel(
    description: "best quality saree",
    image: "assets/images/saree.png",
    name: "High quality silk Saree",
    price: "3,490.00",
    bgColor: const Color(0xFF404966),
  ),
  ClothesModel(
    description: "best quality saree",
    image: "assets/images/saree.png",
    name: "High quality silk Saree",
    price: "3,490.00",
    bgColor: const Color(0xFF1a2828),
  ),
  ClothesModel(
    description: "best quality saree",
    image: "assets/images/saree.png",
    name: "High quality silk Saree",
    price: "3,490.00",
    bgColor: const Color(0xFF1d225a),
  ),
];

List<String> sizeList = ["S", "M", "L", "XL"];

List<Color> colorList = [
  const Color(0xFF366873),
  const Color(0xFF3f2147),
  const Color(0xFF1d225a),
  const Color(0xFF1a2828),
];
