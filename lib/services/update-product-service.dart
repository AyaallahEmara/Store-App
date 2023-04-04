import '../helper/api.dart';
import '../models/product-model.dart';

class UpdateProduct
{
  Future<ProductModel> updateProduct({required String title,required dynamic price,
    required String desc,required String image,
    required String category,required dynamic id}) async
  {
    Map<String,dynamic> data = await Api().put(url:'https://fakestoreapi.com/products/$id', body: {
      'id' :id,
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}