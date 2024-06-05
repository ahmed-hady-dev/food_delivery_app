import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    openLocationSearchBox(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Your Location', style: TextStyle()),
          content: const TextField(decoration: InputDecoration(hintText: 'Search address...')),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle()),
            ),
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Save', style: TextStyle()),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deliver Now', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: <Widget>[
                Text('6901 Hollywood Bly',
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
