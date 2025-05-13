part of 'restaurant_detail_bloc.dart';

sealed class RestaurantDetailEvent extends Equatable {
  const RestaurantDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchRestaurantDetailEvent extends RestaurantDetailEvent {
  final String restaurantId;

  const FetchRestaurantDetailEvent(this.restaurantId);

  @override
  List<Object> get props => [restaurantId];
}