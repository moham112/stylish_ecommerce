import 'package:ecommerce/core/dio_helper.dart';

class AuthWebService {
  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    final response = await DioHelper.postData(
      endPoint: users,
      body: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> auth(Map<String, dynamic> data) async {
    final response = await DioHelper.postData(endPoint: login, body: data);
    return response.data;
  }
}
