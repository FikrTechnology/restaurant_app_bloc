part of '../widgets_package.dart';

class RestaurantDetailCardDrinksWidget extends StatelessWidget {
  const RestaurantDetailCardDrinksWidget({
    super.key,
    required this.data,
  });

  final RestaurantDetail data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.local_drink_rounded,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text("Drinks"),
          ],
        ),
        const SizedBox(height: 16),
        const DottedLine(
          dashColor: Colors.grey,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.menus.drinks.length,
            itemBuilder: (context, index) {
              final drink = data.menus.drinks[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                width: 150,
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(right: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Coconut_Drink_%28Unsplash%29.jpg/640px-Coconut_Drink_%28Unsplash%29.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              drink.name,
                              // style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Rp 20.000",
                              // style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
