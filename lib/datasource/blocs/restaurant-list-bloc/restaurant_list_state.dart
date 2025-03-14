part of 'restaurant_list_bloc.dart';

sealed class RestaurantListState extends Equatable {
  const RestaurantListState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantListInitial extends RestaurantListState {}

class RestaurantListLoading extends RestaurantListState {}

class RestaurantListLoaded extends RestaurantListState {
  final MetaModel? meta;
  final RestaurantListModel? restaurantList;
  
  const RestaurantListLoaded({required this.meta, required this.restaurantList});
  
  @override
  List<Object> get props => [
    meta ?? {},
    restaurantList ?? {},
  ];
}

class RestaurantListError extends RestaurantListState {
  final MetaModel? meta;
  
  const RestaurantListError({required this.meta});
  
  @override
  List<Object> get props => [meta ?? {}];
}