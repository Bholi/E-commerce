
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/common/constant/constant.dart';
import 'package:e_commerce/common/botombar/model/product.dart';
import 'package:e_commerce/features/auth/resources/user_repository.dart';

class ProductRepository {
  final UserRepository userRepository;
  ProductRepository({
    required this.userRepository,
  });
  final List<Product> _products = [];
  List<Product> get products => _products;

  Future<Either<String, List<Product>>> fetchProducts() async {
    try {
      final dio = Dio();
      final Map<String, dynamic> header = {
        "Authorization": "Bearer ${userRepository.userToken}"
      };
      final response = await dio.get(
        "${Constants.baseUrl}/products",
        options: Options(
          headers: header,
        ),
      );
      final items = List.from(response.data["results"])
          .map((e) => Product.fromJson(e))
          .toList();
      _products.clear();
      _products.addAll(items);
      return Right(_products);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to fetch Produucts");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
