import 'package:flutter/material.dart';
import 'package:management_app/features/product/product_home_screen.dart';
import 'package:management_app/features/sale/sale_home_screen.dart';
import 'package:management_app/features/stock/stock_home_screen.dart';

class CustomBottomBar extends StatelessWidget {
  final String type;
  const CustomBottomBar({super.key, required this.type});

  int getSelectedIndex() {
    switch (type) {
      case 'product':
        return 0;
      case 'reseler':
        return 1;
      case 'stock':
        return 2;
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const productPages(),
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const reselerPages(),
          ),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const stockPages(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = getSelectedIndex();

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: selectedIndex == 0 ? Colors.orange : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: const Icon(Icons.shopping_cart),
          ),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: selectedIndex == 1 ? Colors.orange : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: const Icon(Icons.attach_money),
          ),
          label: 'Sales',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: selectedIndex == 2 ? Colors.orange : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: const Icon(Icons.store),
          ),
          label: 'Stocks',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
