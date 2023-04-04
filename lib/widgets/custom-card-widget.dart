import 'package:flutter/material.dart';
import 'package:store/models/product-model.dart';
import 'package:store/services/update-product-service.dart';

import '../screens/update-product-Screen.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.productModel});
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: ()
        {
           Navigator.pushNamed(context, UpdateProductScreen.id ,arguments: {
             productModel,
           });
        },
        child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(

            decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  offset: Offset(1, 1),
                ),
                ]
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.title.substring(0 , 10),style:
                    TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$ ''${productModel.price.toString()}',style:
                        TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),),
                        Icon(Icons.favorite,color: Colors.red,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -60,
            child: Image.network(productModel.image,
              height: 100,
            width: 100,),
          ),
        ],
    ),
      );
  }
}