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
                    _buildCategories(context),
                    _buildFeaturedProducts(),
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

  Widget _buildCategories(BuildContext context) {
    final categories = [
      {
        'name': 'Electronics',
        'icon': Icons.devices,
        'color': Colors.blue,
        'images': [
          'assets/images/electronics1.jpg',
          'assets/images/electronics2.jpg',
          'assets/images/electronics3.jpg',
          'assets/images/electronics4.jpg',
        ],
      },
      {
        'name': 'Furniture',
        'icon': Icons.chair,
        'color': Colors.brown,
        'images': [
          'assets/images/furniture1.jpg',
          'assets/images/furniture2.jpg',
          'assets/images/furniture3.jpg',
          'assets/images/furniture4.jpg',
        ],
      },
      {
        'name': 'Kids',
        'icon': Icons.child_care,
        'color': Colors.pink,
        'images': [
          'assets/images/kids1.png',
          'assets/images/kids2.jpg',
          'assets/images/kids3.jpg',
          'assets/images/kids4.jpg',
        ],
      },
      {
        'name': 'Fashion',
        'icon': Icons.checkroom,
        'color': Colors.purple,
        'images': [
          'assets/images/fashion1.jpg',
          'assets/images/fashion2.jpg',
          'assets/images/fashion3.jpg',
          'assets/images/fashion4.jpg',
        ],
      },
      {
        'name': 'Food & Beverage',
        'icon': Icons.restaurant,
        'color': Colors.orange,
        'images': [
          'assets/images/food1.jpg',
          'assets/images/food2.jpg',
          'assets/images/food3.jpg',
          'assets/images/food4.jpg',
        ],
      },
      {
        'name': 'Others',
        'icon': Icons.more_horiz,
        'color': Colors.grey,
        'images': [
          'assets/images/machine_1.jpg',
          'assets/images/machine_2.png',
          'assets/images/machine_3.jpg',
        ],
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _buildCategoryCard(context, category);
      },
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductsScreen(
              categoryName: category['name'],
              productImages: category['images'],
              categoryColor: category['color'],
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category['color'].withOpacity(0.7),
                category['color'],
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category['icon'],
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                category['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
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
              return _buildFeaturedProductCard(product);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildFeaturedProductCard(Map<String, String> product) {
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
