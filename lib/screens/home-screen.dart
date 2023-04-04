import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/screens/women-screen.dart';
import '../models/product-model.dart';
import '../services/get-all-products-service.dart';
import '../widgets/custom-card-widget.dart';
import 'electronics-screen.dart';
import 'jeweliry-screen.dart';
import 'mens-screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   // print(AllProductsService().getAllProducts());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()
            {
             // Navigator.pushNamed(context, UpdateProductScreen.id);
            },
            icon:Icon(FontAwesomeIcons.cartPlus),color: Colors.black,),
          PopupMenuButton(
            onSelected: (value){
              if(value=='All Products')
                Navigator.pushNamed(context, HomeScreen.id);
              else if(value=='Electronics')
                Navigator.pushNamed(context, ElectronicsScreen.id);
              else if(value=='Jewelery')
                Navigator.pushNamed(context, JeweliryScreen.id);
              else if(value=='Men')
                Navigator.pushNamed(context, MenScreen.id);
              else if(value=='Women')
                Navigator.pushNamed(context, WomenScreen.id);
            },
              color: Colors.grey.shade900,elevation: 1,itemBuilder: (context) => [
            PopupMenuItem(
                value:'All Products',
                child: Text('All Products',style:
            TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
            ),)),
            PopupMenuItem(
                value:'Electronics',
                child: Text('Electronics',style:
            TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
            ),)),
            PopupMenuItem(
                value:'Jewelery',
                child: Text('Jewelery',style:
            TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
            ),)),
            PopupMenuItem(
                value:'Men',
                child: Text('Men',style:
            TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
            ),)),
            PopupMenuItem(
                value:'Women',
                child: Text('Women',style:
            TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
            ),)),
          ]),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:  Text('New Trend',style:
          TextStyle(
            color: Colors.black,
            fontFamily: 'pacifico',
            fontSize: 22,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot){
          //  print(AllProductsService().getAllProducts().toString());
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
            //  print(products);
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context,index){
                  //print(products[index]);
                    return CustomCard(productModel: products[index],);
                  });
            }
            else
              {
                return Center(child: CircularProgressIndicator());
              }
          },
        ),
      ),


    );
  }
}


