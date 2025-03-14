import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app_bloc/datasource/model/api_result_model.dart';
import 'package:restaurant_app_bloc/datasource/model/meta_model.dart';
import 'package:restaurant_app_bloc/datasource/model/restaurant_list.dart';
import 'package:restaurant_app_bloc/datasource/services/restaurant_list_service.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  RestaurantListBloc() : super(RestaurantListInitial()) {
    on<RestaurantListEvent>((event, emit) async {
      emit(RestaurantListLoading());
      try {
        ApiResult<MetaModel, RestaurantListModel> result =
            await RestaurantListService.getRestaurantList();
        if (result.meta!.error == false) {
          emit(RestaurantListLoaded(
              meta: result.meta, restaurantList: result.data));
        } else {
          emit(RestaurantListError(meta: result.meta));
        }
      } catch (e) {
        emit(RestaurantListError(
            meta: MetaModel(error: true, message: 'Failed to load data')));
      }
    });
  }
}
