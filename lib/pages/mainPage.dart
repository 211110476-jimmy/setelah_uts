import 'package:flutter/material.dart';
import 'package:projek_app/pages/promoPage.dart';
import 'homePage.dart';
import 'myOrdersPage.dart';
import 'package:provider/provider.dart';

class PageIndex extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setPageIndex(int index) {
    _index = index;
    notifyListeners();
  }
}

// ignore: camel_case_types
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageIndex>(
      create: (_) => PageIndex(),
      child: Scaffold(
        body: Consumer<PageIndex>(
          builder: (context, pageIndex, _) => IndexedStack(
            index: pageIndex.index,
            children: <Widget>[
              const HomePage(),
              const PromoPage(),
              MyOrdersPage(),
            ],
          ),
        ),
        bottomNavigationBar: Consumer<PageIndex>(
          builder: (context, pageIndex, _) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: pageIndex.index,
            onTap: (int index) {
              Provider.of<PageIndex>(context, listen: false)
                  .setPageIndex(index);
            },
            selectedItemColor: Colors.pink,
            selectedLabelStyle: const TextStyle(color: Colors.pink),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 30,
                  color: pageIndex.index == 0 ? Colors.pink : Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.discount_rounded,
                  size: 30,
                  color: pageIndex.index == 1 ? Colors.pink : Colors.black,
                ),
                label: 'Promos',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt_outlined,
                  size: 30,
                  color: pageIndex.index == 2 ? Colors.pink : Colors.black,
                ),
                label: 'My Orders',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
