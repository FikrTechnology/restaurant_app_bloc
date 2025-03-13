part of '../widgets_package.dart';


class RestaurantDetailCardFoodsWidget extends StatelessWidget {
  const RestaurantDetailCardFoodsWidget({
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
              Icons.fastfood,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text("Foods"),
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
            itemCount: data.menus.foods.length,
            itemBuilder: (context, index) {
              final food = data.menus.foods[index];
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
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Egyptian_food_Koshary.jpg/640px-Egyptian_food_Koshary.jpg",
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(food.name),
                            const SizedBox(height: 8),
                            const Text(
                              "Rp 50.000",
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