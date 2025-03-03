import 'package:restaurant_app_bloc/datasource/model/restaurant_detail_categories.dart';
import 'package:restaurant_app_bloc/datasource/model/restaurant_detail_menus.dart';
import 'package:restaurant_app_bloc/datasource/model/restaurant_detail_reviews.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Categories> categories;
  final Menus menus;
  final double rating;
  final List<CustomerReviews> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      address: json['address'],
      pictureId: json['pictureId'],
      categories: List<Categories>.from(
          json['categories'].map((x) => Categories.fromJson(x))),
      menus: Menus.fromJson(json['menus']),
      rating: json['rating'].toDouble,
      customerReviews: List<CustomerReviews>.from(
          json['customerReviews'].map((x) => CustomerReviews.fromJson(x))),
    );
  }
}

final RestaurantDetail restaurantDetail = RestaurantDetail(
  id: 'rqdv5juczeskfw1e867',
  name: 'Melting Pot',
  description: 'Lorem ipsum dolor sit amet, at mei dolore tritani repudiandae.',
  city: 'Medan',
  address: 'Jln. Pandeglang no 19',
  pictureId: '14',
  categories: [Categories(name: 'Italia'), Categories(name: 'Modern')],
  menus: Menus(
    foods: [Foods(name: 'Paket rosemary')],
    drinks: [Drinks(name: 'Es krim')],
  ),
  rating: 4.2,
  customerReviews: [
    CustomerReviews(
      name: 'Ahmad',
      review: 'Tidak rekomendasi untuk pelajar!',
      date: '13 November 2019',
    ),
    CustomerReviews(
      name: 'Arif',
      review: 'Sangat baik!',
      date: '13 November 2019',
    ),
    CustomerReviews(
      name: 'Dwiki',
      review: 'Sangat baik!',
      date: '13 November 2019',
    ),
  ],
);
