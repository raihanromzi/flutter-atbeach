class Destination {
  String imageUrl;
  String city;
  String country;
  String description;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
  });
}

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Pantai Bali',
    country: 'Indonesia',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Pantai Lombok',
    country: 'Indonesia',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'Pantai Tanjung Harapan',
    country: 'Indonesia',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Pantai Balikpapan',
    country: 'Indonesia',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'Pantai Jogja',
    country: 'Indonesia',
    description: 'Visit New York for an amazing and unforgettable adventure.',
  ),
];
