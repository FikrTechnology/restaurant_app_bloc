part of '../../package.dart';

class RestaurantDetailNewPage extends StatelessWidget {
  final String id;
  const RestaurantDetailNewPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
        builder: (context, state) {
          if (state is RestaurantDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RestaurantDetailError) {
            return Center(
              child: Text(state.meta!.message!),
            );
          } else if (state is RestaurantDetailLoaded) {
            final data = state.restaurantDetail!;
            return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      "https://restaurant-api.dicoding.dev/images/medium/${data.pictureId}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  leading: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, size: 20),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ];
            },
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 60,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(42),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RestaurantDetailCardInfo(data: data),
                    const SizedBox(height: 16),
                    RestaurantDetailCardDescription(data: data),
                    const SizedBox(height: 32),
                    RestaurantDetailCardFoodsWidget(data: data),
                    const SizedBox(height: 32),
                    RestaurantDetailCardDrinksWidget(data: data),
                  ],
                ),
              ),
            ),
          );
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}
