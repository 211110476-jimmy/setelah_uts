import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projek_app/pages/otherApps.dart';
import 'package:projek_app/pages/settingsPage.dart';
import 'auth/loginScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class FoodItem {
  final int id;
  final String name;
  final String description;
  final String price;
  final String imagePath;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    {
      'id': 1,
      'path':
          'https://bankmega.com/media/filer_public/02/48/0248e6c1-b3f3-454f-a4b1-93debf3b1b6b/0-banner-bm-mbm-take-away-nasional2.jpg'
    },
    {
      'id': 2,
      'path':
          'https://i.pinimg.com/736x/35/ed/d2/35edd2351280dff6a3fb0ce19c026fb0.jpg'
    },
    {
      'id': 3,
      'path':
          'https://marketplace.canva.com/EAFNTrS51A8/1/0/1600w/canva-orange-creative-delicious-food-menu-banner-VFdVvBTTwbQ.jpg'
    },
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;
  List<FoodItem> foodList = [
    FoodItem(
      id: 1,
      name: 'Poco C40',
      description: 'HP terbaru dengan spek gahar',
      price: "1.499.000",
      imagePath:
          'https://m.media-amazon.com/images/I/411aDEiwXqL.jpg',
    ),
    FoodItem(
      id: 2,
      name: 'Bango 735 mL',
      description: 'Kecap manis bango dengan biji berkualitas',
      price: "30.000",
      imagePath:
          'https://cf.shopee.co.id/file/id-11134201-23030-3tl6fe38hlov46',
    ),
    FoodItem(
      id: 3,
      name: 'Poco F5',
      description: 'HP terbaru dengan spek gahar',
      price: "5.175.000",
      imagePath:
          'https://awsimages.detik.net.id/community/media/visual/2023/05/10/poco-f5-dan-f5-pro-1.jpeg?w=883',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.supervised_user_circle_sharp,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          )
        ],
        title: const Text(
          'Online Store',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Welcome!'),
              accountEmail: Text('Please Login or Sign Up'),
              // currentAccountPicture: const CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     'https://randomuser.me/api/portraits/women/17.jpg',
              //   ),
              // ),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login / SignUp'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const loginScreen(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SettingsPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text('Other Apps'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => OtherApps(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Today\'s Specials',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    child: Image.network(
                      imageList[index]['path'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: CarouselIndicator(
                count: imageList.length,
                index: currentIndex,
                color: Colors.grey,
                activeColor: Colors.black,
                height: 8,
                width: 8,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Hot Deals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  final foodItem = foodList[index];
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(
                            foodItem.imagePath,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodItem.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  foodItem.description,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Harga: \Rp.${foodItem.price}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 115,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Order Now'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink,
                              onPrimary: Colors.white,
                              padding: const EdgeInsets.all(17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
