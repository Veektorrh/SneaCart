import 'package:flutter/material.dart';

class ShoeCards extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;

  const ShoeCards({super.key, required this.title, required this.price, required this.image, required this.backgroundColor}  
  );

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(15.0),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              SizedBox( height: 5,),
              Text("\$$price", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox( height: 5,),
              Center(child: Image.asset(image))
              //Image(image: AssetImage(image))
            ],

          ),
        )
    );

  }
}