import 'api.dart';

class ProductService {

  static Future getProducts() async {

    final response = await ApiService.dio.get(
      "/api/Products",
    );

    return response.data;

  }
  static Future getCategories() async {

  final response = await ApiService.dio.get(
    "/api/Categories",
  );

  return response.data;

}
static Future addToCart(int productId, int quantity) async {

  final response = await ApiService.dio.post(
    "/api/Cart/add",
    queryParameters: {
      "productId": productId,
      "quantity": quantity
    },
  );

  return response.data;

}

}