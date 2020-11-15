import 'package:flutter/material.dart';

class TypesAndSubjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TypesAndSubjectsState();
  }
}

class _TypesAndSubjectsState extends State<TypesAndSubjects> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Types and subjects',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.green),
                  onPressed: () => null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
