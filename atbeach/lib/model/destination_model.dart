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
    city: 'Bali',
    price: 'Rp. 2.500.000,00',
    description:
        'Bali officially the Bali Province (Indonesian: Provinsi Bali is a province of Indonesia and the westernmost of the Lesser Sunda Islands. East of Java and west of Lombok, the province includes the island of Bali and a few smaller neighbouring islands, notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan. The provincial capital, Denpasar,[7] is the most populous city in the Lesser Sunda Islands and the second-largest, after Makassar, in Eastern Indonesia. The upland town of Ubud in Greater Denpasar is considered Bali cultural centre. The province is Indonesias main tourist destination, with a significant rise in tourism since the 1980s. Tourism-related business makes up 80% of its economy',
  ),
  Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Lombok',
    price: 'Rp. 1.500.000,00',
    description:
        'Lombok is an island in West Nusa Tenggara province, Indonesia. It forms part of the chain of the Lesser Sunda Islands, with the Lombok Strait separating it from Bali to the west and the Alas Strait between it and Sumbawa to the east. It is roughly circular, with a "tail" (Sekotong Peninsula) to the southwest, about 70 kilometres (43 miles) across and a total area of about 4,738.65 square kilometres (1,829.60 square miles). The provincial capital and largest city on the island is Mataram.',
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'Yogyakarta',
    price: 'Rp. 1.000.000,00',
    description:
        'Yogyakarta (often called “Jogja”) is a city on the Indonesian island of Java known for its traditional arts and cultural heritage. Its ornate 18th-century royal complex, or kraton, encompasses the still-inhabited Sultan’s Palace. Also within the kraton are numerous open-air pavilions that host classical Javanese dance shows and concerts of gamelan music, characterized by gongs, chimes and plucked string instruments. ',
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'Balikpapan',
    price: 'Rp. 1.800.000,00',
    description:
        'Balikpapan is a port city on the island of Borneo, in Indonesia. Its known for beaches such as white-sand Kemala Beach. Stalls in Kebun Sayur market sell jewelry, gemstones and souvenirs. Agung At-Taqwa mosque is decorated with large geometric patterns. North of the city, Bangkirai Hill has a canopy bridge above the rainforest. The Samboja Lestari sanctuary houses rescued orangutans and sun bears. ',
  ),
  Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'Papua',
    price: 'Rp. 1.200.000,00',
    description:
        'Papua, Indonesia’s easternmost province, encompasses the western half of New Guinea and several other islands. An area of cultural and biological diversity, its rainforests and mountains are inhabited by indigenous Melanesian tribes and diverse wildlife including tree kangaroos and birds of paradise. Whale sharks swim amid the hard coral gardens of Cenderawasih Bay National Park, a dive site off the north coast. ',
  ),
];
