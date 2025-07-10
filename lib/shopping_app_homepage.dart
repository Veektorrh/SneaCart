import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
//import 'package:shopping_app/cart_page.dart';
//import 'package:shopping_app/product_details_page.dart';
import 'package:shopping_app/product_list_page.dart';
//import 'package:shopping_app/shoe_cards_page.dart';
//import 'package:shopping_app/global_variables.dart';

class ShoppingAppHomepage extends StatefulWidget {  
  const ShoppingAppHomepage({super.key});

  @override
  State<ShoppingAppHomepage> createState() => _ShoppingAppHomepageState();
}

class _ShoppingAppHomepageState extends State<ShoppingAppHomepage> {

int currentPage = 0;
List<Widget> pages = [
ProductListPage(),
CartPage()
];

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: IndexedStack( index: currentPage,children:pages), //pages[currentPage],
    bottomNavigationBar: BottomNavigationBar(onTap: (value) {
      setState(() {
        currentPage = value;
      });
    },
      selectedItemColor: Colors.amberAccent,
      currentIndex: currentPage,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart")
    ],iconSize: 35,),
    );
  }
}