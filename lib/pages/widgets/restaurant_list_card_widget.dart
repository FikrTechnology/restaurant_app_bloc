part of 'widgets_package.dart';

class RestaurantListCardWidget extends StatelessWidget {
  const RestaurantListCardWidget({
    super.key,
    required this.restaurant,
  });

  final RestaurantList restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => RestaurantDetailBloc()..add(FetchRestaurantDetailEvent(restaurant.id)),
                child: RestaurantDetailNewPage(
                  id: restaurant.id,
                ),
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(restaurant.name),
                    Text(restaurant.city),
                    Text(restaurant.rating.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
