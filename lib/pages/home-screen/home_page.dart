part of '../../package.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late RestaurantListBloc _restaurantListBloc;
  @override
  void initState() {
    super.initState();
    _restaurantListBloc = RestaurantListBloc()..add(FetchRestaurantList());
  }

  @override
  void dispose() {
    super.dispose();
    _restaurantListBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<RestaurantListBloc, RestaurantListState>(
        bloc: _restaurantListBloc,
        builder: (context, state) {
          if (state is RestaurantListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RestaurantListLoaded) {
            final restaurantList = state.restaurantList!.restaurants;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final restaurant = state.restaurantList!.restaurants[index];
                return RestaurantListCardWidget(restaurant: restaurant);
              },
            );
          } else if (state is RestaurantListError) {
            return Center(
              child: Text(state.meta!.message!),
            );
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        }
      ),
    );
  }
}
