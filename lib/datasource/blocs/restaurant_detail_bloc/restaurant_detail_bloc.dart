import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app_bloc/datasource/model/meta_model.dart';
import 'package:restaurant_app_bloc/datasource/model/restaurant_detail.dart';
import 'package:restaurant_app_bloc/datasource/services/restaurant_list_service.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  RestaurantDetailBloc() : super(RestaurantDetailLoading()) {
    on<FetchRestaurantDetailEvent>((event, emit) async {
      emit(RestaurantDetailLoading());
      try {
        final restaurantDetail =
            await RestaurantListService.getRestaurantDetail(event.restaurantId);
        if (restaurantDetail.meta?.error == false) {
          emit(RestaurantDetailLoaded(
              restaurantDetail.meta, restaurantDetail.data!));
        } else {
          emit(RestaurantDetailError(
              MetaModel(error: true, message: restaurantDetail.meta?.message ?? 'Unknown error')));
        }
      } catch (e) {
        emit(RestaurantDetailError(
            MetaModel(error: true, message: 'Failed to load data')));
      }
    });
  }
}
