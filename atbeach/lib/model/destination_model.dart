class Destination {
  String imageUrl;
  String city;
  String price;
  String description;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.price,
    required this.description,
  });
}

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Pantai Bali',
    price: 'Rp. 2.500.000,00',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Pantai Lombok',
    price: 'Rp. 1.500.000,00',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'Pantai Tanjung Harapan',
    price: 'Rp. 1.000.000,00',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Pantai Balikpapan',
    price: 'Rp. 1.800.000,00',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'Pantai Jogja',
    price: 'Rp. 1.200.000,00',
    description: 'Visit New York for an amazing and unforgettable adventure.',
  ),
];
