import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  const MyFoodTile({Key? key, required this.food, required this.onTap}) : super(key: key);
  final Food food;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(food.name, style: const TextStyle()),
                      Text('\$${food.price}', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                      const SizedBox(height: 10),
                      Text(food.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
