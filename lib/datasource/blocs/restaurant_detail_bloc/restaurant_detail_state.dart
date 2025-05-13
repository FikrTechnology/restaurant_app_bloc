part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailState extends Equatable {
  const RestaurantDetailState();

  @override
  List<Object> get props => [];
}

class RestaurantDetailLoading extends RestaurantDetailState {}

class RestaurantDetailLoaded extends RestaurantDetailState {
  final MetaModel? meta;
  final RestaurantDetail? restaurantDetail;

  const RestaurantDetailLoaded(this.meta, this.restaurantDetail);

  @override
  List<Object> get props => [
    meta ?? {},
    restaurantDetail ?? {},
    ];
}

class RestaurantDetailError extends RestaurantDetailState {
  final MetaModel? meta;

  const RestaurantDetailError(this.meta);

  @override
  List<Object> get props => [
    meta ?? {}
    ];
}
