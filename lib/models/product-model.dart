class ProductModel
{
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;
  ProductModel({required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  required this.rating,});
  
  factory ProductModel.fromJson(jsonData)
  {

    return ProductModel(id: jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel
{
   final dynamic rate;
   final dynamic count;

   RatingModel({required this.rate,required this.count});
   
   factory RatingModel.fromJson(jsonData)
   {
     //print(jsonData['rate']);
     return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
   }
}