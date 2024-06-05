import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  FoodPage({Key? key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddon) {
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(widget.food.imagePath),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.food.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("\$${widget.food.price}",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16)),
                    const SizedBox(height: 10),
                    Text(widget.food.description),
                    const SizedBox(height: 10),
                    Divider(color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(height: 10),
                    Text('Add-ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          final addon = widget.food.availableAddons[index];
                          return CheckboxListTile(
                            value: widget.selectedAddons[addon],
                            activeColor: Theme.of(context).colorScheme.primary,
                            title: Text(addon.name, style: const TextStyle()),
                            subtitle: Text('\$${addon.price}',
                                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                            onChanged: (value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              MyButton(
                text: 'Add to cart',
                onTap: () => addToCart(widget.food, widget.selectedAddons),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.only(left: 12, top: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
