import 'package:flutter/material.dart';

// default void main() {
//   runApp(AgroConnectApp());
// }

class AgroConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroConnect',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AgroConnectHomePage(),
    );
  }
}

class AgroConnectHomePage extends StatelessWidget {
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
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Places',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
              const SectionTitle(title: 'Top Places'),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MarketCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Dabulla Market',
                      itemsCount: 123,
                      description:
                          'apple, banana, mango, orange, grape, watermelon...',
                    ),
                    MarketCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Nuwara Eliya Market',
                      itemsCount: 102,
                      description:
                          'potato, carrot, onion, garlic, ginger, beetroot...',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Predicted Places'),
              const SizedBox(height: 10),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/150'),
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
      child: Container(
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
