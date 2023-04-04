import 'package:flutter/material.dart';
import 'package:store/models/product-model.dart';
import 'package:store/screens/home-screen.dart';
import 'package:store/screens/women-screen.dart';
import 'package:store/services/update-product-service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/custom-button-widget.dart';
import '../widgets/custom-text-field-widget.dart';
import 'electronics-screen.dart';
import 'jeweliry-screen.dart';
import 'mens-screen.dart';

class UpdateProductScreen extends StatefulWidget {
   UpdateProductScreen({Key? key}) : super(key: key);
   static String id='UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
   String? productName ,desc,image;
   bool isLoading=false;
   dynamic? price;
 //  ProductModel? model;

  @override
  Widget build(BuildContext context) {
  //  print(ModalRoute.of(context)!.settings.arguments as Set<ProductModel>);
    Set<ProductModel> model=ModalRoute.of(context)!.settings.arguments as Set<ProductModel> ;
    // print(model);
  //  ProductModel? productModel =model as ProductModel;

    return
      ModalProgressHUD
        (
        inAsyncCall: isLoading,
        child: Scaffold(
        appBar: AppBar(
          actions: [
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
          title: Text('Update Product',style:
            TextStyle(
              color: Colors.black,
              fontFamily: 'pacifico',
              fontSize: 28,
            ),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                CustomTextField(hintText: 'Product Name',onChanged: (data){
                  productName=data;
                },),
                SizedBox(height: 10,),
                CustomTextField(hintText: 'Description',onChanged: (data){
                  desc=data;
                },),
                SizedBox(height: 10,),
                CustomTextField(textInputType:TextInputType.number,hintText: 'Price',onChanged: (data){
                  price=(data);
                },),
                SizedBox(height: 10,),
                CustomTextField(hintText: 'Image',onChanged: (data){
                  image=data;
                },),
                SizedBox(height: 70,),
                CustomButton(bottonText: 'Update',
                  onTap: () async
                  {
                    isLoading=true;
                    setState(() {});
                    try {
                      await updateProduct(model.elementAt(0));
                      showSnackBar(context,'Updated Successfull'
                          'y');
                      Navigator.pushNamed(context, HomeScreen.id);
                    }catch(ex)
                    {
                      print(ex.toString());
                    }
                    isLoading=false;
                    setState(() {});
                    },
                  ),
              ],
            ),
          ),
        ),
    ),
      );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    print(productModel.id);
   await UpdateProduct().updateProduct(
        title: productName == null ? productModel.title : productName!,
        price: price == null ? productModel.price.toString() : price!,
        desc: desc == null ? productModel.description : desc!,
        image: image == null ? productModel.image : image!,
        id: productModel.id.toString(),
        category: productModel.category
   );
  }
   void showSnackBar(BuildContext context,String message) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar
       (content: Text(message),),);
   }
}
