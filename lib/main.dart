import 'package:flutter/material.dart';

void main() {
  runApp(const AgroConnectApp());
}

class AgroConnectApp extends StatelessWidget {
  const AgroConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroConnect',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AgroConnectHomePage(),
    );
  }
}

class AgroConnectHomePage extends StatelessWidget {
  const AgroConnectHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroConnect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Places',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Feature Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FeatureIcon(title: 'Weather', icon: Icons.cloud),
                  FeatureIcon(title: 'Price', icon: Icons.attach_money),
                  FeatureIcon(title: 'Community', icon: Icons.people),
                  FeatureIcon(title: 'Marketplace', icon: Icons.store),
                ],
              ),
              const SizedBox(height: 20),
              // Top Places Section
              const SectionTitle(title: 'Top Places'),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MarketCard(
                      imageUrl:
                          'https://www.shutterstock.com/image-photo/dambulla-sri-lanka-mar-7-600nw-2292651595.jpg',
                      title: 'Dabulla Market',
                      itemsCount: 123,
                      description:
                          'apple, banana, mango, orange, grape, watermelon...',
                    ),
                    MarketCard(
                      imageUrl:
                          'https://media-cdn.tripadvisor.com/media/photo-s/11/6e/bd/f1/market-place-in-nuwara.jpg',
                      title: 'Nuwara Eliya Market',
                      itemsCount: 102,
                      description:
                          'potato, carrot, onion, garlic, ginger, beetroot...',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Predicted Places Section
              const SectionTitle(title: 'Predicted Places'),
              const SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/3043328/pexels-photo-3043328.jpeg?cs=srgb&dl=pexels-armand-m-3043328.jpg&fm=jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// Feature Icon Widget
class FeatureIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeatureIcon({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.yellow,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Market Card Widget
class MarketCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int itemsCount;
  final String description;

  const MarketCard({
    required this.imageUrl,
    required this.title,
    required this.itemsCount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl,
                height: 100, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('$itemsCount Items'),
                  Text(
                    description,
                    maxLines: 2,
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
