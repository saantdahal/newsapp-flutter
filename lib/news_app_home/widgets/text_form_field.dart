import 'package:flutter/material.dart';

class TextFormFieldWidgets extends StatelessWidget {
  const TextFormFieldWidgets({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Find Interesting News',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
          ),
          child: const Text('Search'),
        ),
      ),
    );
  }
}
