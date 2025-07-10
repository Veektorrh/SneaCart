import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/global_variables.dart';

import 'controllers/cart_controller.dart';
//import 'package:shopping_app/global_variables.dart';
class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put((CartController()));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.product['title'] as String, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35), ),
            Spacer(flex: 1,),
            Image.asset(widget.product['imageUrl'] as String),
            Spacer(flex: 2,),
            Container(
              width: double.infinity,
            height: 250,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 234, 234),
            borderRadius: BorderRadius.circular(50), 
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child: 
                  ListView.builder(
                    itemCount:(widget.product['sizes'] as List<int>).length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                  final size = (widget.product['sizes'] as List<int>)[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Chip(backgroundColor: selectedSize == size ? const Color.fromARGB(255, 245, 221, 3) : null,
                        padding: EdgeInsets.all(10.0),
                        label: 
                       Text(size.toString(), style: TextStyle(fontSize: 20),)
                        ),
                    ),
                  );
                  }
                  ),
                ),
                //SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: 
                  ElevatedButton.icon( icon: Icon(Icons.shopping_cart), iconAlignment: IconAlignment.start,
                    onPressed: (){
                    if (selectedSize != 0) {
                    controller.addProduct(
                        {
                          'id': widget.product['id'],
                          'title': widget.product['title'],
                          'price': widget.product['price'],
                          'sizes': selectedSize,
                          'company': widget.product['company'],
                          'imageUrl': widget.product['imageUrl']
                        }
                    ); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Added Succesfully!')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Select a size!')));
                    }
                    }, label: Text('Add to Cart', style:
                   TextStyle(color: Colors.black, fontSize: 15) ), style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 245, 221, 3), minimumSize:Size(double.infinity, 50))
                  // ElevatedButton(onPressed: (){},
                  // //ElevatedButton.icon( label: Icon(Icons.shopping_cart),
                  // style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 245, 221, 3), minimumSize:Size(double.infinity, 50), ),
                  // child: Text('Add to Cart', style: 
                  // TextStyle(color: Colors.black, fontSize: 15),
                  ), 
                  ), 
                  
                
                // Row(
                //   children: [
                //   Chip(label: 
                //   Text((product['sizes'] as List<int>)[0].toString())
                //   )
                //   ],
                // )

        ]
        ),
            )
            ])      
    )
    );
  }
}



  