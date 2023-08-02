import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/common/constant/constant.dart';
import 'package:e_commerce/common/utils/shared_pred_utils.dart';
import 'package:e_commerce/features/model/user.dart';



class UserRepository {
Future<void> initialize() async{
  _userToken = await SharedPreUtils.getToken();
  _user = await SharedPreUtils.getUser();

}

String _userToken = "";
User? _user;
String  get userToken => _userToken;
User? get user => _user;


Future<void> logout() async{
  await SharedPreUtils.removeToken();
   await SharedPreUtils.removeUser();
}

  Future<Either<String, void>> signUp({
    required String fullName,
    required String phoneNumber,
    required String address,
    required String email,
    required String password,
  }) async {
    try {
      final dio = Dio();
      final Map<String, dynamic> body = {
        "name": fullName,
        "email": email,
        "password": password,
        "phone": phoneNumber,
        "address": address,
      };
      final _ = await dio.post(
        "${Constants.baseUrl}/auth/register",
        data: body,
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(e.response?.data["error"]?["message"] ?? "Unable to signup");
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final dio = Dio();
      final Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      final res = await dio.post(
        "${Constants.baseUrl}/auth/login",
        data: body,
      );
      final String token = await res.data["token"];
      
      final tempUser = User.fromJson(res.data["results"]);
      _user = tempUser;
      _userToken = token;
     await SharedPreUtils.saveToken(token);
     await SharedPreUtils.saveUser(tempUser);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? "Unable to Login");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
