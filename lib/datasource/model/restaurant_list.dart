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

class RestaurantListModel {
  final List<RestaurantList> restaurants;

  RestaurantListModel({
    required this.restaurants,
  });

  factory RestaurantListModel.fromJson(List<dynamic> json) {
    return RestaurantListModel(
      restaurants: json.map((e) => RestaurantList.fromJson(e)).toList(),
    );
  }
}
