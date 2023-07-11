import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'notificationPage.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  bool _isAllSelected = true;
  bool _isNearestSelected = false;
  bool _isHighestRatingSelected = false;
  String _promoCode = '';

  List<Restaurant> _restaurants = [
    Restaurant(
        image: 'assets/images/realfood.webp',
        name: 'Realfood Official, Jakarta Barat',
        distance: 1200,
        rating: 4.7),
    Restaurant(
        image: 'assets/images/fonterra.png',
        name: 'Fonterra, Tangerang',
        distance: 947,
        rating: 4.5),
    Restaurant(
        image: 'assets/images/oreo.png',
        name: 'Oreo, Deli Serdang',
        distance: 17,
        rating: 4.2),
    Restaurant(
        image: 'assets/images/unilever.png',
        name: 'Unilever Indonesia, Medan',
        distance: 5,
        rating: 4.4),
  ];

  List<Restaurant> get filteredRestaurants {
    if (_isAllSelected) {
      return _restaurants;
    } else if (_isNearestSelected) {
      return _restaurants..sort((a, b) => a.distance.compareTo(b.distance));
    } else {
      return _restaurants..sort((a, b) => b.rating.compareTo(a.rating));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    final tween = Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.ease));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: NotificationPage(),
                    );
                  },
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Promo Discount',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _promoCode = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Promos you can\'t resist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButton(
                  text: 'All',
                  isSelected: _isAllSelected,
                  onPressed: () {
                    setState(() {
                      _isAllSelected = true;
                      _isNearestSelected = false;
                      _isHighestRatingSelected = false;
                    });
                  },
                ),
                ToggleButton(
                  text: 'Nearest',
                  isSelected: _isNearestSelected,
                  onPressed: () {
                    setState(() {
                      _isAllSelected = false;
                      _isNearestSelected = true;
                      _isHighestRatingSelected = false;
                    });
                  },
                ),
                ToggleButton(
                  text: 'Highest Rating',
                  isSelected: _isHighestRatingSelected,
                  onPressed: () {
                    setState(() {
                      _isAllSelected = false;
                      _isNearestSelected = false;
                      _isHighestRatingSelected = true;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (BuildContext context, int index) {
                return RestaurantCard(
                  restaurant: filteredRestaurants[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const ToggleButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => isSelected ? Colors.green : Colors.grey,
        ),
      ),
      child: Text(text),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            restaurant.image,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16.0),
                  SizedBox(width: 4.0),
                  Text('${restaurant.distance} KM'),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.star, size: 16.0),
                  SizedBox(width: 8.0),
                  Text('${restaurant.rating}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Restaurant {
  final String image;
  final String name;
  final double distance;
  final double rating;

  const Restaurant({
    required this.image,
    required this.name,
    required this.distance,
    required this.rating,
  });
}
