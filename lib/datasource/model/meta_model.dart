class MetaModel {
  final bool? error;
  final String? message;
  final int? count;
  final int? founded;
  final dynamic restaurants;
  final dynamic customerReviews;

  MetaModel({
    this.error,
    this.message,
    this.count,
    this.founded,
    this.restaurants,
    this.customerReviews,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      founded: json['founded'],
      restaurants: json['restaurants'],
      customerReviews: json['customerReviews'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'count': count,
      'founded': founded,
      'restaurants': restaurants,
      'customerReviews': customerReviews,
    };
  }
  
}
