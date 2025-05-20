part of '../widgets_package.dart';

class ReviewInputFormWidget extends StatefulWidget {
  final Function(CustomerReviews) onSubmit;
  final VoidCallback? onCancel;

  const ReviewInputFormWidget({super.key, required this.onSubmit, this.onCancel});

  @override
  State<ReviewInputFormWidget> createState() => _ReviewInputFormWidgetState();
}

class _ReviewInputFormWidgetState extends State<ReviewInputFormWidget> {
  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Nama',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _reviewController,
          decoration: const InputDecoration(
            labelText: 'Komentar',
            border: OutlineInputBorder(),
          ),
          minLines: 2,
          maxLines: 4,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty && _reviewController.text.isNotEmpty) {
                    widget.onSubmit(
                      CustomerReviews(
                        name: _nameController.text,
                        review: _reviewController.text,
                        date: DateTime.now().toIso8601String().substring(0, 10),
                      ),
                    );
                    _nameController.clear();
                    _reviewController.clear();
                  }
                },
                child: const Text('Kirim Komentar'),
              ),
            ),
            const SizedBox(width: 8),
            if (widget.onCancel != null)
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onCancel,
                  child: const Text('Batal'),
                ),
              ),
          ],
        ),
      ],
    );
  }
}