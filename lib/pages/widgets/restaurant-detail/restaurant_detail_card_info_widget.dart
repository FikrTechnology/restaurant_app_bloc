part of '../widgets_package.dart';

class RestaurantDetailCardInfo extends StatelessWidget {
  const RestaurantDetailCardInfo({
    super.key,
    required this.data,
  });

  final RestaurantDetail data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(data.categories.map((e) => e.name).join(', ')),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.location_on),
                    title: Text(data.city),
                    subtitle: Text(data.address),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            data.rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            '${data.customerReviews.length} Reviews',
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                  ),
                                  builder: (context) {
                                    List<CustomerReviews> reviews =
                                        List.from(data.customerReviews);
                                    bool showForm = false;

                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        if (showForm) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: ReviewInputFormWidget(
                                              onSubmit: (newReview) {
                                                setState(() {
                                                  reviews.add(newReview);
                                                  showForm = false;
                                                });
                                              },
                                              onCancel: () {
                                                setState(() {
                                                  showForm = false;
                                                });
                                              },
                                            ),
                                          );
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'Customer Reviews',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(height: 16),
                                                ...reviews.map((review) =>
                                                    ListTile(
                                                      leading: const Icon(
                                                          Icons.person),
                                                      title: Text(review.name),
                                                      subtitle: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(review.review),
                                                          Text(
                                                            review.date,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                const Divider(),
                                                ElevatedButton.icon(
                                                  icon: const Icon(
                                                      Icons.add_comment),
                                                  label:
                                                      const Text('Add Review'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                    foregroundColor:
                                                        Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Tambah Review'),
                                                          content:
                                                              SingleChildScrollView(
                                                            child:
                                                                ConstrainedBox(
                                                              constraints:
                                                                  const BoxConstraints(
                                                                maxWidth:
                                                                    600, // opsional, agar tidak terlalu lebar di tablet/web
                                                              ),
                                                              child:
                                                                  ReviewInputFormWidget(
                                                                onSubmit:
                                                                    (newReview) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          newReview);
                                                                },
                                                                onCancel: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .fromLTRB(24,
                                                                  20, 24, 24),
                                                        );
                                                      },
                                                    ).then((result) {
                                                      if (result != null &&
                                                          result
                                                              is CustomerReviews) {
                                                        setState(() {
                                                          reviews.add(result);
                                                        });
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  });
                            },
                            child: const Text(
                              'Lihat Reviews',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
