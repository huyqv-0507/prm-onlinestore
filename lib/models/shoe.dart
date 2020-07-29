import 'package:flutter/material.dart';

class Shoe {
  final String title, image, description;
  final int id, price;
  final double size, discount;
  final Color color;

  Shoe(
      {this.title,
      this.image,
      this.description,
      this.id,
      this.price,
      this.size,
      this.discount,
      this.color});
}

List<Shoe> get getShoes => shoes;

List shoes = <Shoe>[
  Shoe(
      id: 1,
      title: 'Nike Air Max 97',
      image: 'assets/images/shoe1.jpg',
      description:
          "Remastered from the OG that shook up the running world, the Nike Air Max 97 elevates the classic design. Bold new colours draw inspiration from the Hanshin Tigers, one of Japan's oldest baseball teams.",
      price: 227,
      size: 41,
      discount: 0.1,
      color: Colors.blue),
  Shoe(
      id: 2,
      title: 'The Nike ZoomX Vaporfly',
      image: 'assets/images/shoe2.jpg',
      description:
          'The Nike ZoomX Vaporfly NEXT% clears your path to record-breaking speed with a lighter design and faster feel than before. With more cushioning underfoot and reduced weight up top, the result is unprecedented energy return and comfort.',
      price: 317,
      size: 41,
      discount: 0,
      color: Colors.blue),
  Shoe(
      id: 3,
      title: 'Nike Air Zoom Pegasus 37',
      image: 'assets/images/shoe3.jpg',
      description:
          'The Nike Air Zoom Pegasus 37 BETRUE lets you celebrate and honor the LGBTQIA+ community. Its breathable upper features a gradient rainbow with matching Swoosh. Details on the tongue and eyelets add a perfect shine. Nike React foam combines with Zoom Air to cushion your journey.',
      price: 165,
      size: 41,
      discount: 0.0,
      color: Colors.blue),
  Shoe(
      id: 4,
      title: 'Jordan Delta',
      image: 'assets/images/shoe4.jpg',
      description:
          "The Jordan Delta has a design that's expressive and comfortable from the inside out. Made from a mix of materials, this shoe has plush, lightweight foam underfoot. It's meticulously crafted for a look and feel only Jordan Brand can deliver.",
      price: 317,
      size: 41,
      discount: 0.1,
      color: Colors.blue),
  Shoe(
      id: 5,
      title: 'Nike Air Zoom SuperRep',
      image: 'assets/images/shoe5.jpg',
      description:
          'The Nike Air Zoom SuperRep is designed for circuit training, HIIT, short runs and other fast-paced exercise. Zoom Air cushioning in the forefoot combines with a wide, stable heel to keep you moving and lifting comfortably.',
      price: 155,
      size: 41,
      discount: 0.1,
      color: Colors.blue),
  Shoe(
      id: 6,
      title: 'Air Jordan XXXIV PF',
      image: 'assets/images/shoe6.jpg',
      description:
          'The Air Jordan XXXIV PF continues the legacy of a cultural icon. Light, responsive and sculpted with aerodynamic precision, it combines a boldly unconventional midsole with herringbone traction to merge innovative and iconic design elements.',
      price: 221,
      size: 41,
      discount: 0.1,
      color: Colors.blue),
];
