class RestaurantList {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  RestaurantList({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> json) {
    return RestaurantList(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
    };
  }
}

final List<RestaurantList> restaurantList = [
  RestaurantList(
    id: 'rqdv5juczeskfw1e867',
    name: 'Melting Pot',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '14',
    city: 'Medan',
    rating: 4.2,
  ),
  RestaurantList(
    id: 's1knt6za9kkfw1e867',
    name: 'Kafe Kita',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '25',
    city: 'Gorontalo',
    rating: 4.5,
  ),
  RestaurantList(
    id: 'w9pga3s2tubkfw1e867',
    name: 'Bring Your Phone Cafe',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '18',
    city: 'Surabaya',
    rating: 4.7,
  ),
  RestaurantList(
    id: '8maika7f0jkfw1e867',
    name: 'Kafein',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '22',
    city: 'Aceh',
    rating: 4.6,
  ),
  RestaurantList(
    id: 'uewq1zg2zlskfw1e867',
    name: 'Hello Kite',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '23',
    city: 'Manado',
    rating: 4.4,
  ),
  RestaurantList(
    id: 'oldha8b0zkfw1e867',
    name: 'Cafe Cemara',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '24',
    city: 'Bandung',
    rating: 4.8,
  ),
  RestaurantList(
    id: '6jkyt6k7eikfw1e867',
    name: 'Warunk Upnormal',
    description:
        'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
    pictureId: '19',
    city: 'Jakarta',
    rating: 4.9,
  ),
];
