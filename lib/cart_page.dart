import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:shopping_app/global_variables.dart';

import 'controllers/cart_controller.dart';
//import 'package:shopping_app/product_details_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put((CartController()));
    return  Scaffold( 
      appBar: AppBar(title: Text('Cart'), centerTitle: true,),
      body: GetBuilder<CartController>(builder: (cartController){ return ListView.builder(
          itemCount: controller.cart.length,
          itemBuilder: (context, index) {
            final selectedProduct = controller.cart[index];
            return
              ListTile(
                title: Text('${cartController.cart[index]['title']}',
                    style: TextStyle(fontWeight: FontWeight.bold,)),
                subtitle: Text('Size: ${cartController.cart[index]['sizes']}'),
                leading: CircleAvatar(backgroundImage: AssetImage(
                    '${cartController.cart[index]['imageUrl']}'), radius: 30,),
                trailing: IconButton(onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Delete Item',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                          content: Text(
                              'Do you wish to delete item from cart?'),
                          actions: [
                            TextButton(onPressed: () {
                              controller.removeProduct(selectedProduct);
                              Navigator.of(context).pop();
                            },
                                child: Text('Yes',
                                  style: TextStyle(color: Colors.green),)),
                            TextButton(onPressed: () {
                              Navigator.of(context).pop();
                            },
                                child: Text(
                                  'No', style: TextStyle(color: Colors.red),))
                          ],
                        );
                      });
                }, icon: Icon(Icons.delete, color: Colors.red)),
              );
          });
          }
      )
    );
}
}