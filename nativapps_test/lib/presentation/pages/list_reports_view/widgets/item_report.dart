import 'package:flutter/material.dart';

class ItemReport extends StatelessWidget {
  const ItemReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        leading: Container(height: 20, width: 20, color: Colors.red),
        title: const Text('Description'),
      ),
    );
  }
}
