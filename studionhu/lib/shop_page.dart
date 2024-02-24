import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ShopItem.loadShopItems(100),
        builder: (context, AsyncSnapshot<List<ShopItem>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final items = snapshot.data!;
          return Column(
            children: [
              const Text(
                'Hình Ảnh',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    return ShopItemCard(item: item);
                  },
                ),
              ),
            ],
          );
        });
  }
}

class ShopItemCard extends StatelessWidget {
  const ShopItemCard({
    super.key,
    required this.item,
  });

  final ShopItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              item.image,
              scale: 0.8,
            ),
          ),
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     bottom: 20,
          //   ),
          //   child: Text(
          //     item.price,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16,
          //       color: Colors.red,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

// Model
class ShopItem {
  final String name;
  final String image;

  const ShopItem(this.name, this.image);

  // Future ~ Promise cua JS
  static Future<List<ShopItem>> loadShopItems(int count) async {
    await Future.delayed(const Duration(seconds: 3));
    return List.generate(
      count,
      (index) => ShopItem(
        'Hình $index',
        'assets/products/product-${(index % 10) + 1}.jpg',
      ),
    );
  }
}
