import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'category_products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gulit Market'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    _buildFeaturedProducts(),
                    _buildCategorySection(
                      'Electronics',
                      Icons.devices,
                      Colors.blue,
                      [
                        'assets/images/electronics1.jpg',
                        'assets/images/electronics2.jpg',
                        'assets/images/electronics3.jpg',
                        'assets/images/electronics4.jpg',
                      ],
                    ),
                    _buildCategorySection(
                      'Furniture',
                      Icons.chair,
                      Colors.brown,
                      [
                        'assets/images/furniture1.jpg',
                        'assets/images/furniture2.jpg',
                        'assets/images/furniture3.jpg',
                        'assets/images/furniture4.jpg',
                      ],
                    ),
                    _buildCategorySection(
                      'Kids',
                      Icons.child_care,
                      Colors.pink,
                      [
                        'assets/images/kids1.png',
                        'assets/images/kids2.jpg',
                        'assets/images/kids3.jpg',
                        'assets/images/kids4.jpg',
                      ],
                    ),
                    _buildCategorySection(
                      'Fashion',
                      Icons.checkroom,
                      Colors.purple,
                      [
                        'assets/images/fashion1.jpg',
                        'assets/images/fashion2.jpg',
                        'assets/images/fashion3.jpg',
                        'assets/images/fashion4.jpg',
                      ],
                    ),
                    _buildCategorySection(
                      'Food & Beverage',
                      Icons.restaurant,
                      Colors.orange,
                      [
                        'assets/images/food1.jpg',
                        'assets/images/food2.jpg',
                        'assets/images/food3.jpg',
                        'assets/images/food4.jpg',
                      ],
                    ),
                    _buildCategorySection(
                      'Others',
                      Icons.more_horiz,
                      Colors.grey,
                      [
                        'assets/images/machine_1.jpg',
                        'assets/images/machine_2.png',
                        'assets/images/machine_3.jpg',
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _buildCategorySection(
    String categoryName,
    IconData icon,
    Color color,
    List<String> images,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Navigate to category products screen
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _buildProductCard(
                {
                  'name': 'Product ${index + 1}',
                  'price': '\$${(index + 1) * 99}.99',
                  'image': images[index],
                  'category': categoryName,
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFeaturedProducts() {
    final featuredProducts = [
      {
        'name': 'Smartphone',
        'price': '\$999.99',
        'image': 'assets/images/electronics1.jpg',
        'category': 'Electronics',
      },
      {
        'name': 'Modern Sofa',
        'price': '\$799.99',
        'image': 'assets/images/furniture1.jpg',
        'category': 'Furniture',
      },
      {
        'name': 'Kids Toy Set',
        'price': '\$49.99',
        'image': 'assets/images/kids1.png',
        'category': 'Kids',
      },
      {
        'name': 'Designer Watch',
        'price': '\$299.99',
        'image': 'assets/images/fashion1.jpg',
        'category': 'Fashion',
      },
      {
        'name': 'Organic Food Pack',
        'price': '\$39.99',
        'image': 'assets/images/food1.jpg',
        'category': 'Food & Beverage',
      },
      {
        'name': 'Industrial Machine',
        'price': '\$1999.99',
        'image': 'assets/images/machine_1.jpg',
        'category': 'Others',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              final product = featuredProducts[index];
              return _buildProductCard(product);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                product['image']!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['price']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['category']!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
