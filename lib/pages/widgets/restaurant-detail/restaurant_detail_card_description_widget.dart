part of '../widgets_package.dart';

class RestaurantDetailCardDescription extends StatelessWidget {
  const RestaurantDetailCardDescription({
    super.key,
    required this.data,
  });

  final RestaurantDetail data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Description"),
            const SizedBox(height: 16),
            ReadMoreText(
              data.description,
              trimLines: 2,
              colorClickableText: Colors.green,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
