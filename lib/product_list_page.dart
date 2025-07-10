import 'package:flutter/material.dart';
import 'package:shopping_app/product_details_page.dart';
import 'package:shopping_app/shoe_cards_page.dart';
import 'package:shopping_app/global_variables.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<String> filters = const [
  "All", "Adidas", "Nike", "Bata", "Puma"
];
late String selectedFilter;


@override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
     final border =  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                      );
    return SafeArea(

        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Shoes\nCollection", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search", prefixIcon: Icon(Icons.search),
                      //border: border,
                      focusedBorder: border,
                      enabledBorder: border,
                      
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
                      // )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 120,
              child:
              ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount:filters.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                  child: 
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filters[index];
                      });
                    }, 
                    child: Chip(
                      label: Text(filters[index].toString(), 
                      style: TextStyle(fontWeight: FontWeight.bold),), 
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    backgroundColor: selectedFilter == filters[index]? Colors.yellow : const Color.fromARGB(255, 236, 234, 234),
                    side: BorderSide(
                      color: const Color.fromARGB(255, 236, 234, 234)
                    ),
                    ),
                  ),
                );
              },),
            ),

    Expanded(
      child: size.width > 650 ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
             childAspectRatio: 2.0,
             mainAxisSpacing: 10,
             crossAxisSpacing: 10),
    itemCount: products.length,
    itemBuilder:(context, index) {
    return GestureDetector( onTap: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return ProductDetailsPage(product: products[index]);
    }
    ));
    },
    child: ShoeCards(
    title: products[index]['title'] as String,
    price: products[index]['price'] as double,
    image: products[index]['imageUrl'] as String,
    backgroundColor: index.isEven ? const Color.fromARGB(255, 161, 198, 228) : const Color.fromARGB(255, 236, 234, 234),

    ),
    );
    },)

        :ListView.builder(
      itemCount: products.length,
      itemBuilder:(context, index) {
      return GestureDetector( onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return ProductDetailsPage(product: products[index]);
      }
      ));
      },
      child: ShoeCards(
      title: products[index]['title'] as String,
      price: products[index]['price'] as double,
      image: products[index]['imageUrl'] as String,
      backgroundColor: index.isEven ? const Color.fromARGB(255, 161, 198, 228) : const Color.fromARGB(255, 236, 234, 234),

      ),
      );
      },


      // GridView.builder(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  //   childAspectRatio: 0.65,
                  //   mainAxisSpacing: 10,
                  //   crossAxisSpacing: 10),
                  //   itemCount: products.length,
                  //   itemBuilder:(context, index) {
                  //     return GestureDetector( onTap: (){
                  //       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //         return ProductDetailsPage(product: products[index]);
                  //       }
                  //      ));
                  //       },
                  //              child: ShoeCards(
                  //         title: products[index]['title'] as String,
                  //         price: products[index]['price'] as double,
                  //         image: products[index]['imageUrl'] as String,
                  //         backgroundColor: index.isEven ? const Color.fromARGB(255, 161, 198, 228) : const Color.fromARGB(255, 236, 234, 234),
                  //
                  //       ),
                  //     );
                  //   },
                  //   ),
                ),
    ),

          ],
        ),
      );
  }
}